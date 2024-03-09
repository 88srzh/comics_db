// Flutter imports:
import 'package:flutter/material.dart';

class AccountChangeLanguageWidget extends StatefulWidget {
  const AccountChangeLanguageWidget({super.key});

  @override
  State<AccountChangeLanguageWidget> createState() => _AccountChangeLanguageWidgetState();
}

class _AccountChangeLanguageWidgetState extends State<AccountChangeLanguageWidget> {
  bool _change = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _change,
      onChanged: (bool value) {
        setState(
          () {
            _change = value;
          },
        );
      },
      title: Text(
        'Change language (RU/EN)',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
