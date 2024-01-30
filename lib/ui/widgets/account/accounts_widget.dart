import 'package:comics_db_app/domain/api_client/auth_api_client.dart';
import 'package:comics_db_app/ui/widgets/account/guest_account_widget.dart';
import 'package:flutter/material.dart';

class AccountsWidget extends StatefulWidget {
  const AccountsWidget({super.key});

  @override
  State<AccountsWidget> createState() => _AccountsWidgetState();
}

class _AccountsWidgetState extends State<AccountsWidget> {
  final _authApiClient = AuthApiClient();
  @override
  Widget build(BuildContext context) {
    final guestSessionId = _authApiClient.guestAuth();
    return guestSessionId != null ? const GuestAccountWidget() : const AccountsWidget();
  }
}
