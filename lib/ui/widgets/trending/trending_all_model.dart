// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/trending_all.dart';
import 'package:comics_db_app/domain/entity/trending_all_response.dart';

class TrendingAllModel extends ChangeNotifier {
  final _apiClient = MovieAndTvApiClient();
  final _trendingAll = <TrendingAll>[];
  late int _currentPage;
  late int _totalPage;
  late String mediaType;
  late String timeWindow;
  var _isLoadingInProgress = false;

  List<TrendingAll> get trendingAll => List.unmodifiable(_trendingAll);
  late DateFormat _dateFormat;
  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupPage(BuildContext context) async {
    _dateFormat = DateFormat.yMMMd();
    await _resetTrendingAllList();
  }

  Future<void> _resetTrendingAllList() async {
    _currentPage = 0;
    _totalPage = 1;
    _trendingAll.clear();
    await _loadNextTrendingAllPage();
  }

  Future<TrendingAllResponse> _loadTrendingAll(
      int nextPage, String mediaType, String timeWindow) async {
    return await _apiClient.trendingAll(nextPage, mediaType, timeWindow);
  }

  Future<void> _loadNextTrendingAllPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;
    try {
      final trendingAllResponse =
          await _loadTrendingAll(nextPage, mediaType, timeWindow);
      _trendingAll.addAll(trendingAllResponse.trendingAll);
      _currentPage = trendingAllResponse.page;
      _totalPage = trendingAllResponse.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void showedTrendingAllAtIndex(int index) {
    if (index < _trendingAll.length - 1) return;
    _loadNextTrendingAllPage();
  }
}
