import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/ui/widgets/account/account_widget.dart';
import 'package:comics_db_app/ui/widgets/account/guest_account_widget.dart';
import 'package:flutter/material.dart';

class AccountsWidget extends StatefulWidget {
  const AccountsWidget({super.key});

  @override
  State<AccountsWidget> createState() => _AccountsWidgetState();
}

class _AccountsWidgetState extends State<AccountsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int id;
    // final id = session.getAccountId();

    // if (id != null) {
    //   return const AccountWidget();
    // } else {
    //   return const GuestAccountWidget();
    // }
    Future<Widget?> returnWidget() async {
      SessionDataProvider session = SessionDataProvider();
      final id = session.getAccountId();
      if (id != null) {
        const AccountWidget();
      } else {
        const GuestAccountWidget();
      }
      return null;
    }
    return returnWidget;
  }
}
