// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_account_list_tile.dart';
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_setting_divider_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/account/components/head_account_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/heading_account_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/notification_card_widget.dart';
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
        const CustomSettingDivider(height: 3.0),
        const HeadingAccountCardWidget(headingText: 'Watchlist'),
        const CustomSettingDivider(height: 0.8),
        CustomAccountListTile(text: 'Movie', icon: MdiIcons.bookmark, onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.watchlistMovie)),
        const CustomSettingDivider(height: 0.8),
        // TODO need to change tv icon to one style
        CustomAccountListTile(text: 'TV', icon: Icons.tv, onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.watchlistTV)),
        const CustomSettingDivider(height: 3.0),
        const HeadingAccountCardWidget(headingText: 'Favorites'),
        const CustomSettingDivider(height: 0.8),
        CustomAccountListTile(text: 'Movies', icon: MdiIcons.movie, onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.favoriteMovies)),
        const CustomSettingDivider(height: 0.8),
        CustomAccountListTile(text: 'TV', icon: Icons.tv, onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.favoriteTvs)),
        const CustomSettingDivider(height: 10.0),
        const HeadingAccountCardWidget(headingText: 'Settings'),
        const CustomSettingDivider(height: 0.8),
        const SettingsCardWidget(),
        const CustomSettingDivider(height: 0.8),
        const NotificationsCardWidget(),
        const CustomSettingDivider(height: 0.8),
        CustomAccountListTile(
            text: 'Logout',
            icon: MdiIcons.logout,
            onTap: () {
              cubit.logout();
              Navigator.pushNamedAndRemoveUntil(context, '/auth', (_) => false);
            }),
        const CustomSettingDivider(height: 0.5),
        // const AnimationFab(),
      ],
    );
  }
}
