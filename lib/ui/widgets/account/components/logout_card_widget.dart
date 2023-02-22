import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutCardWidget extends StatelessWidget {
  const LogoutCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AccountDetailsCubit>();

    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return ListTile(
          onTap: () {
            cubit.logout();
            Navigator.pushNamedAndRemoveUntil(context, '/auth', (_) => false);
          },
          title: Text(
            'Logout',
            style: TextStyle(
              color: notifierTheme.isDark ? Colors.white : AppColors.kPrimaryColor,
              fontSize: 14,
            ),
          ),
          trailing: Icon(
            Icons.logout,
            color: notifierTheme.isDark ? Colors.white : AppColors.kPrimaryColor,
          ),
        );
      },
    );
  }
}
