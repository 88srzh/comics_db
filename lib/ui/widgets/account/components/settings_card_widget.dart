// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';

class SettingsCardWidget extends StatefulWidget {
  const SettingsCardWidget({super.key});

  @override
  State<SettingsCardWidget> createState() => _SettingsCardWidgetState();
}

class _SettingsCardWidgetState extends State<SettingsCardWidget> {
  bool change = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
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
