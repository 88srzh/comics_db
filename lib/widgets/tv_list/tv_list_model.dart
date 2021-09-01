import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TVListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tvs = <TV>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;

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
    _currentPage = 0;
    _totalPage = 1;
    _tvs.clear();
    _loadTVs();
  }

  Future<void> _loadTVs() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final tvsResponse = await _apiClient.popularTV(nextPage, _locale);
    _tvs.addAll(tvsResponse.tvs);
    _currentPage = tvsResponse.page;
    _totalPage = tvsResponse.totalPages;
    _isLoadingInProgress = false;
    notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
      print('какая-то хуйня');
    }
  }

    void onTVTap(BuildContext context, int index) {
    final id = _tvs[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.tvDetails, arguments: id);
  }

    void showedTVAtIndex(int index) {
    if (index < _tvs.length - 1) return;
    print(index);
    _loadTVs();
  }
}
