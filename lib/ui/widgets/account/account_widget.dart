import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/blocs/account/account_bloc.dart';
import 'package:comics_db_app/ui/components/custom_setting_divider_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/heading_account_card_widget.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<AccountDetailsBloc>();
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
          HeadingAccountCardWidget(headingText: 'General'),
          CustomSettingDivider(),
          LogoutCardWidget(),
          CustomSettingDivider(),
          HeadingAccountCardWidget(headingText: 'Settings'),
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
