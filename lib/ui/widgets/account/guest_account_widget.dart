import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/components/custom_account_list_tile.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GuestAccountWidget extends StatefulWidget {
  const GuestAccountWidget({super.key});

  @override
  State<GuestAccountWidget> createState() => _GuestAccountWidgetState();
}

class _GuestAccountWidgetState extends State<GuestAccountWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AccountDetailsCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: Text('You are logged in as a guest account.')),
        CustomAccountListTile(
          text: 'Logout',
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
                          'Do you really want to logout?',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              child: const Text('Cancel'),
                              onPressed: () => Navigator.pop(context),
                            ),
                            ElevatedButton(
                              child: const Text('Logout'),
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
      ],
    );
  }
}
