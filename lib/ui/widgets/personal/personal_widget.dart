import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_setting_divider_widget.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_view_cubit.dart';
import 'package:comics_db_app/ui/widgets/personal/components/heading_personal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalWidget extends StatefulWidget {
  const PersonalWidget({Key? key}) : super(key: key);

  @override
  State<PersonalWidget> createState() => _PersonalWidgetState();
}

class _PersonalWidgetState extends State<PersonalWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.kPrimaryColor,
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
    return ColoredBox(
      color: AppColors.bottomBarBackgroundColor,
      child: Column(
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
      ),
    );
  }
}

class LogoutCardWidget extends StatelessWidget {
  const LogoutCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthViewCubit>();
    return ListTile(
      onTap: () {
        cubit.logout();
        Navigator.pushNamedAndRemoveUntil(context, '/auth', (_) => false);
        // Navigator.pushNamed(context, MainNavigationRouteNames.auth);
      },
      title: const Text(
        'Logout',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      trailing: const Icon(
        Icons.logout,
        color: Colors.white,
      ),
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
      activeColor: Colors.pinkAccent,
      inactiveThumbColor: Colors.grey,
      value: themeColor,
      onChanged: (bool value) {
        setState(
              () {
            themeColor = value;
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
      activeColor: Colors.pinkAccent,
      inactiveThumbColor: Colors.grey,
      value: notifications,
      onChanged: (bool value) {
        setState(
              () {
            notifications = value;
          },
        );
      },
      title: const Text(
        'Push notifications',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
