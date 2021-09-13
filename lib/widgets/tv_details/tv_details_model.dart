import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TVDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final int tvId;
  String _locale = '';
  late DateFormat _dateFormat;
  TVDetails? _tvDetails;

  TVDetails? get tvDetails => _tvDetails;

  TVDetailsModel(this.tvId);

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale = locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    await loadTVDetails();
  }

  Future<void> loadTVDetails() async {
    _tvDetails = await _apiClient.tvDetails(tvId, _locale);
  }

}