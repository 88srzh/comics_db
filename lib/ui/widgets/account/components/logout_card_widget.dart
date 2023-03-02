import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
