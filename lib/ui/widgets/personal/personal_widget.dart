import 'package:comics_db_app/ui/components/custom_setting_divider.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/personal/components/heading_personal_card_widget.dart';
import 'package:flutter/material.dart';

class PersonalWidget extends StatelessWidget {
  const PersonalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const BodyPersonalWidget(),
    );
  }
}

class BodyPersonalWidget extends StatefulWidget {
  const BodyPersonalWidget({Key? key}) : super(key: key);

  @override
  State<BodyPersonalWidget> createState() => _BodyPersonalWidgetState();
}

class _BodyPersonalWidgetState extends State<BodyPersonalWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        HeadingPersonalCardWidget(headingText: 'General'),
        CustomSettingDivider(),
        LogoutCardWidget(),
        CustomSettingDivider(),
        HeadingPersonalCardWidget(headingText: 'Settings'),
        CustomSettingDivider(),
        SettingsCardWidget(),
        CustomSettingDivider(),
        NotificationsCardWidget(),
        CustomSettingDivider(),
      ],
    );
  }
}

class LogoutCardWidget extends StatelessWidget {
  const LogoutCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, MainNavigationRouteNames.auth);
      },
      title: const Text('Logout'),
      trailing: const Icon(Icons.logout),
    );
  }
}

class SettingsCardWidget extends StatefulWidget {
  const SettingsCardWidget({Key? key}) : super(key: key);

  @override
  State<SettingsCardWidget> createState() => _SettingsCardWidgetState();
}

class _SettingsCardWidgetState extends State<SettingsCardWidget> {
  bool themeColor = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: themeColor,
      onChanged: (bool value) {},
      title: const Text('Change color theme'),
    );
  }
}

class NotificationsCardWidget extends StatefulWidget {
  const NotificationsCardWidget({Key? key}) : super(key: key);

  @override
  State<NotificationsCardWidget> createState() => _NotificationsCardWidgetState();
}

class _NotificationsCardWidgetState extends State<NotificationsCardWidget> {
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: notifications,
      onChanged: (bool value) {},
      title: const Text('Push notifications'),
    );
  }
}
