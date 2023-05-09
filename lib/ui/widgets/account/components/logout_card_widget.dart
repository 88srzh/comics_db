// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';

class LogoutCardWidget extends StatelessWidget {
  const LogoutCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AccountDetailsCubit>();
    return ListTile(
      onTap: () {
        cubit.logout();
        Navigator.pushNamedAndRemoveUntil(context, '/auth', (_) => false);
      },
      title: Text(
        'Logout',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      trailing: Icon(
        Icons.logout,
        color: context.read<ThemeBloc>().isDarkTheme
            ? Colors.white
            : DarkThemeColors.kPrimaryColor,
      ),
    );
  }
}
