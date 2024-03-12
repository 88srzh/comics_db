// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/generated/l10n.dart';
import 'package:comics_db_app/ui/components/custom_account_list_tile.dart';
import 'package:comics_db_app/ui/components/custom_setting_divider_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/account/components/head_account_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/heading_account_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/notification_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/account_settings_theme_card_widget.dart';

class BodyPersonalWidget extends StatefulWidget {
  const BodyPersonalWidget({super.key});

  @override
  State<BodyPersonalWidget> createState() => _BodyPersonalWidgetState();
}

class _BodyPersonalWidgetState extends State<BodyPersonalWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AccountDetailsCubit>();
    // final Color titleColor = context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.titleColor : Colors.white;
    // TODO name don't work
    // final name = cubit.state.name;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadAccountCardWidget(),
            const CustomSettingDivider(height: 3.0),
            HeadingAccountCardWidget(headingText: S.of(context).watchlist),
            const CustomSettingDivider(height: 0.8),
            CustomAccountListTile(
                text: S.of(context).movie, icon: MdiIcons.movie, onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.watchlistMovie)),
            const CustomSettingDivider(height: 0.8),
            CustomAccountListTile(text: S.of(context).tv, icon: Icons.tv, onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.watchlistTV)),
            const CustomSettingDivider(height: 3.0),
            HeadingAccountCardWidget(headingText: S.of(context).favorites),
            const CustomSettingDivider(height: 0.8),
            CustomAccountListTile(
                text: S.of(context).movie, icon: MdiIcons.movie, onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.favoriteMovies)),
            const CustomSettingDivider(height: 0.8),
            CustomAccountListTile(text: S.of(context).tv, icon: Icons.tv, onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.favoriteTvs)),
            const CustomSettingDivider(height: 10.0),
            HeadingAccountCardWidget(headingText: S.of(context).settings),
            const CustomSettingDivider(height: 0.8),
            AccountSettingsThemeCardWidget(),
            const CustomSettingDivider(height: 0.8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    S.load(const Locale('ru'));
                  }),
                  child: const Text('RU'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    S.load(const Locale('en'));
                  }),
                  child: const Text('EN'),
                ),
              ],
            ),

            const CustomSettingDivider(height: 0.8),
            NotificationsCardWidget(),
            const CustomSettingDivider(height: 0.8),
            CustomAccountListTile(
              text: S.of(context).logout,
              icon: MdiIcons.logout,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.bottomBarBackgroundColor : Colors.white,
                      title: Center(
                        child: Text(
                          'Logout',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      content: SizedBox(
                        height: 80,
                        width: 200,
                        child: Column(
                          children: [
                            Text(
                              S.of(context).doYouReallyWantToLogout,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  child: Text(S.of(context).cancel),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                ElevatedButton(
                                  child:  Text(S.of(context).logout),
                                  onPressed: () {
                                    cubit.logout().whenComplete(() => Navigator.pushNamedAndRemoveUntil(context, '/auth', (_) => false));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const CustomSettingDivider(height: 0.5),
            // const AnimationFab(),
          ],
        ),
      ],
    );
  }
}
