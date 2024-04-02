// Flutter imports:
import 'package:flutter/cupertino.dart';
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
import 'package:comics_db_app/ui/widgets/account/components/account_settings_theme_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/head_account_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/heading_account_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/notification_card_widget.dart';

class BodyPersonalWidget extends StatefulWidget {
  final String watchlist;

  const BodyPersonalWidget({super.key, required this.watchlist});

  @override
  State<BodyPersonalWidget> createState() => _BodyPersonalWidgetState();
}

class _BodyPersonalWidgetState extends State<BodyPersonalWidget> {
  bool change = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AccountDetailsCubit>();
    // TODO name don't work
    // final name = cubit.state.name;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadAccountCardWidget(),
            const CustomSettingDivider(height: 3.0),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.0,
                              color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 50.0,
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 2.0,
                                              color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor),
                                        ),
                                        color: Colors.grey,
                                      ),
                                      child: Text(S.of(context).movie, style: const TextStyle(color: Colors.white))),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('111', style: TextStyle(color: Colors.white)),
                                  Text('333', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: const BoxDecoration(color: Colors.pink),
                          child: const Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(height: 100.0, child: Text('444', style: TextStyle(color: Colors.white))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('444', style: TextStyle(color: Colors.white)),
                                  Text('555', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            HeadingAccountCardWidget(headingText: widget.watchlist),
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
            AccountSettingsThemeCardWidget(headingText: S.of(context).theme),
            const CustomSettingDivider(height: 0.8),
            NotificationsCardWidget(headingText: S.of(context).notifications),
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
                          S.of(context).logout,
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
                                  child: Text(S.of(context).logout),
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
