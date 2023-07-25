import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCardWidget extends StatefulWidget {
  const SettingsCardWidget({Key? key}) : super(key: key);

  @override
  State<SettingsCardWidget> createState() => _SettingsCardWidgetState();
}

class _SettingsCardWidgetState extends State<SettingsCardWidget> {
  bool change = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Colors.pinkAccent,
      inactiveThumbColor: Colors.grey,
      value: change,
      onChanged: (bool value) {
        setState(
          () {
            context.read<ThemeBloc>().add(const ThemeEvent());
            change = value;
          },
        );
      },
      title: Text(
        'Change color theme',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
