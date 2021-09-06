import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/latest_all.dart';
import 'package:comics_db_app/domain/entity/latest_all_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TrendModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _trendAll = <TrendAll>[];
  late int _currentPage;
  late int _totalPage;
  String? mediaType;
  String? timeWindow;
  var _isLoadingInProgress = false;

  List<TrendAll> get trendAll => List.unmodifiable(_trendAll);
  late DateFormat _dateFormat;
  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupPage(BuildContext context) async {
    _dateFormat = DateFormat.yMMMd();
    await _resetTrendAllList();
  }

  Future<void> _resetTrendAllList() async {
    _currentPage = 0;
    _totalPage = 1;
    _trendAll.clear();
    await _loadNextTrendAllPage();
  }

  Future<LatestAllResponse> _loadTrendAll(
      int nextPage, String? mediaType, String? timeWindow) async {
    return await _apiClient.trendAll(nextPage, mediaType, timeWindow);
  }

  Future<void> _loadNextTrendAllPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;
    try {
      final trendAllResponse =
          await _loadTrendAll(nextPage, mediaType, timeWindow);
      _trendAll.addAll(trendAllResponse.latestAll);
      _currentPage = trendAllResponse.page;
      _totalPage = trendAllResponse.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void showedTrendAllAtIndex(int index) {
    if (index < _trendAll.length - 1) return;
    _loadNextTrendAllPage();
  }
}
