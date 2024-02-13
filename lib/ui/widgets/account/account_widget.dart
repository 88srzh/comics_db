// Flutter imports:
import 'package:comics_db_app/ui/widgets/account/components/body_account_details_widget.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

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
      body: BodyPersonalWidget(),
    );
  }
}
