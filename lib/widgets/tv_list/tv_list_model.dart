import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TVListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tvs = <TV>[];
  List<TV> get tvs => List.unmodifiable(_tvs);
  late DateFormat _dateFormat;
  String _locale = '';

// ! - TODO: вынести в отдельный файл
    String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

    void setupLocale(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    _tvs.clear();
    _loadTVs();
  }

  Future<void> _loadTVs() async {
    final tvsResponse = await _apiClient.popularTV(1, _locale);
    _tvs.addAll(tvsResponse.tvs);
    notifyListeners();
  }

    void onTVTap(BuildContext context, int index) {
    final id = _tvs[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.tvDetails, arguments: id);
  }
}
