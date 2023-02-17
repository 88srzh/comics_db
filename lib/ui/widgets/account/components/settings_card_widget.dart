import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsCardWidget extends StatefulWidget {
  const SettingsCardWidget({Key? key}) : super(key: key);

  @override
  State<SettingsCardWidget> createState() => _SettingsCardWidgetState();
}

class _SettingsCardWidgetState extends State<SettingsCardWidget> {
  // bool themeColor = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        return SwitchListTile(
          activeColor: Colors.pinkAccent,
          inactiveThumbColor: Colors.grey,
          value: themeNotifier.isDark,
          onChanged: (bool value) {
            setState(
                  () {
                themeNotifier.isDark = value;
              },
            );
          },
          title: Text(
            'Change color theme',
            style: TextStyle(
              color: themeNotifier.isDark ? Colors.white : AppColors.kPrimaryColor,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
