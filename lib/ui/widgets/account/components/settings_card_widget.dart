import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCardWidget extends StatefulWidget {
  const SettingsCardWidget({Key? key}) : super(key: key);

  @override
  State<SettingsCardWidget> createState() => _SettingsCardWidgetState();
}

class _SettingsCardWidgetState extends State<SettingsCardWidget> {
  // bool themeColor = false;

  @override
  Widget build(BuildContext context) {
    // final bool isSwitch;
    return SwitchListTile(
      activeColor: Colors.pinkAccent,
      inactiveThumbColor: Colors.grey,
      value: false,
      onChanged: (bool value) {
        setState(
          () {
            context.read<ThemeBloc>().add(const ThemeEvent());
            value;
          },
        );
      },
      title: Text(
        'Change color theme',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
