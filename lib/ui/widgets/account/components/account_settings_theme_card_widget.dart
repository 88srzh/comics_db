// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';

class AccountSettingsThemeCardWidget extends StatefulWidget {
  const AccountSettingsThemeCardWidget({super.key, required this.headingText});
  final String headingText;

  @override
  State<AccountSettingsThemeCardWidget> createState() => _AccountSettingsThemeCardWidgetState();
}

class _AccountSettingsThemeCardWidgetState extends State<AccountSettingsThemeCardWidget> {
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
        widget.headingText,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
