import 'package:flutter/material.dart';

class SettingsCardWidget extends StatefulWidget {
  const SettingsCardWidget({Key? key}) : super(key: key);

  @override
  State<SettingsCardWidget> createState() => _SettingsCardWidgetState();
}

class _SettingsCardWidgetState extends State<SettingsCardWidget> {
  // bool themeColor = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Colors.pinkAccent,
      inactiveThumbColor: Colors.grey,
      value: false,
      onChanged: (bool value) {
        setState(
          () {
            value;
          },
        );
      },
      title: const Text(
        'Change color theme',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
