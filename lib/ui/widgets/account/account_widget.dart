// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/account/components/body_account_details_widget.dart';

// Package imports:


class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  late Future<String> lazyValue;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyPersonalWidget(),
    );
  }
}
