import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class SettingsModel extends ChangeNotifier {
  // final _sessionDataProvider = SessionDataProvider();
  // final _apiClient = ApiClient();
  String _locale = '';
  late DateFormat _dateFormat;
  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    // await loadMovieDetails();
  }
}