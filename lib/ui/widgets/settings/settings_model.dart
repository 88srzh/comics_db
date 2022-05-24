import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SettingsModel extends ChangeNotifier {
  String _locale = '';
  late DateFormat _dateFormat;
  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
  }
}