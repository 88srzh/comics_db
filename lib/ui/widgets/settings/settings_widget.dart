// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_setting_divider_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const BodySettingsWidget(),
    );
  }
}

class BodySettingsWidget extends StatelessWidget {
  const BodySettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        // HeadingPersonalCardWidget(headingText: 'General'),
        CustomSettingDivider(height: 0.5),
        GeneralCard(),
        CustomSettingDivider(height: 0.5),
      ],
    );
  }
}

class GeneralCard extends StatelessWidget {
  const GeneralCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, MainNavigationRouteNames.auth);
      },
      title: const Text('Quit'),
      trailing: const Icon(Icons.logout),
    );
  }
}
