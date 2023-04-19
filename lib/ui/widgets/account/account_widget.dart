// Flutter imports:
import 'package:comics_db_app/ui/components/animation_fab.dart';
import 'package:comics_db_app/ui/widgets/account/components/logout_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/settings_card_widget.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_setting_divider_widget.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/account/components/heading_account_card_widget.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<AccountDetailsCubit>().setupAccountDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    // var cubit = context.watch<AccountDetailsCubit>();
    // that's name need to check cubit data
    // final name = cubit.state.name;
    return const Scaffold(
      // appBar: CustomMainAppBarWidget(),
      body: BodyPersonalWidget(),
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
    final cubit = context.watch<AccountDetailsCubit>();
    final name = cubit.state.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingAccountCardWidget(headingText: name),
        const CustomSettingDivider(),
        const LogoutCardWidget(),
        const CustomSettingDivider(),
        const HeadingAccountCardWidget(headingText: 'Settings'),
        const CustomSettingDivider(),
        const SettingsCardWidget(),
        const CustomSettingDivider(),
        const NotificationsCardWidget(),
        const CustomSettingDivider(),
        const AnimationFab(),
      ],
    );
  }
}

class NotificationsCardWidget extends StatefulWidget {
  const NotificationsCardWidget({Key? key}) : super(key: key);

  @override
  State<NotificationsCardWidget> createState() =>
      _NotificationsCardWidgetState();
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
      title: Text(
        'Push notifications',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
