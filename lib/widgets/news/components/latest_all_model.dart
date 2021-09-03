import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/latest_all.dart';
import 'package:comics_db_app/domain/entity/latest_all_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class LatestAllModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _latestAll = <LatestAll>[];
  late int _currentPage;
  late int _totalPage;
  String mediaType = 'all';
  String timeWindow = 'week';
  var _isLoadingInProgress = false;

  List<LatestAll> get latestAll => List.unmodifiable(_latestAll);
  late DateFormat _dateFormat;
  String stringFromDate(DateTime? date) =>
    date != null ? _dateFormat.format(date) : '';

  Future<void> setupPage(BuildContext context) async {
    _dateFormat = DateFormat.yMMMd();
    await _resetLatestAllList();
  }

  Future<void> _resetLatestAllList() async {
    _currentPage = 0;
    _totalPage = 1;
    await _loadNextLatestAllPage();
  }

  Future<LatestAllResponse> _loadLatestAll(int nextPage, String mediaType, String timeWindow) async {
    return await _apiClient.latestAll(nextPage, mediaType, timeWindow);
  }

  Future<void> _loadNextLatestAllPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;
    try {
      final latestAllResponse = await _loadLatestAll(nextPage, mediaType, timeWindow);
    _latestAll.addAll(latestAllResponse.latestAll);
    _currentPage = latestAllResponse.page;
    _totalPage = latestAllResponse.totalPages;
    _isLoadingInProgress = false;
    notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void showedLatestAllAtIndex(int index) {
    if (index < _latestAll.length -1) return;
    _loadNextLatestAllPage();
  }
}