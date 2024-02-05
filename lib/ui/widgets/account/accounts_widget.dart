import 'package:comics_db_app/domain/api_client/auth_api_client.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/account/account_widget.dart';
import 'package:comics_db_app/ui/widgets/account/guest_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsWidget extends StatefulWidget {
  const AccountsWidget({super.key});

  @override
  State<AccountsWidget> createState() => _AccountsWidgetState();
}

class _AccountsWidgetState extends State<AccountsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // TODO if guest session - what to do?
    context.read<AccountDetailsCubit>().setupAccountDetails(context);
  }

  final _authApiClient = AuthApiClient();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AccountDetailsCubit>();
    final username = cubit.state.username;
    // final guestSessionId = authApiClient.guestAuth();
    // return guestSessionId != null ? const GuestAccountWidget() : const AccountWidget();
    return cubit != null ? const AccountWidget() : const GuestAccountWidget();
    // return const AccountWidget();
  }
}
