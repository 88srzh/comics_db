// Flutter imports:
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/HeadAccountCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_account_list_tile.dart';
import 'package:comics_db_app/ui/components/custom_setting_divider_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/account/components/heading_account_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/settings_card_widget.dart';

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
    return const Scaffold(
      appBar: CustomDetailsAppBar(title: ''),
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
    // TODO name don't work
    // final name = cubit.state.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadAccountCardWidget(),
        const CustomSettingDivider(),
        const HeadingAccountCardWidget(headingText: 'Favorites'),
        const CustomSettingDivider(),
        CustomAccountListTile(text: 'Movies', icon: MdiIcons.movie, onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.favoriteMovies)),
        const CustomSettingDivider(),
        CustomAccountListTile(text: 'TV', icon: Icons.tv, onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.favoriteTvs)),
        const CustomSettingDivider(),
        const HeadingAccountCardWidget(headingText: 'Settings'),
        const CustomSettingDivider(),
        const SettingsCardWidget(),
        const CustomSettingDivider(),
        const NotificationsCardWidget(),
        const CustomSettingDivider(),
        CustomAccountListTile(
            text: 'Logout',
            icon: MdiIcons.logout,
            onTap: () {
              cubit.logout();
              Navigator.pushNamedAndRemoveUntil(context, '/auth', (_) => false);
            }),
        const CustomSettingDivider(),
        // const AnimationFab(),
      ],
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
      title: Text(
        'Push notifications',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
