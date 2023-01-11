// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

class SettingsModel extends ChangeNotifier {
  String _locale = '';
  late DateFormat dateFormat;
  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    dateFormat = DateFormat.yMMMd(locale);
  }
}
