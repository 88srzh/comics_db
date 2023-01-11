// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/popular_tv_response.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';

class AiringTodayTvsModel extends ChangeNotifier {
  final _apiClient = MovieAndTvApiClient();
  final _tvs = <TV>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  String? _searchQuery;
  String _locale = '';
  Timer? searchDebounce;

  List<TV> get tvs => List.unmodifiable(_tvs);
  late DateFormat _dateFormat;

// ! - TODO: вынести в отдельный файл
  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    await _resetTVList();
  }

  Future<void> _resetTVList() async {
    _currentPage = 0;
    _totalPage = 1;
    _tvs.clear();
    _loadNextTVsPage();
  }

  Future<PopularTVResponse> _loadTVs(int nextPage, String locale) async {
    final query = _searchQuery;
    if (query == null) {
      return await _apiClient.airingTodayTvs(
          nextPage, _locale, Configuration.apiKey);
    } else {
      return await _apiClient.searchTV(
          nextPage, _locale, query, Configuration.apiKey);
    }
  }

  Future<void> _loadNextTVsPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final tvsResponse = await _loadTVs(nextPage, _locale);
      _tvs.addAll(tvsResponse.tvs);
      _currentPage = tvsResponse.page;
      _totalPage = tvsResponse.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
      // print('какая-то хуйня');
    }
  }

  void onTVTap(BuildContext context, int index) {
    final id = _tvs[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.tvDetails, arguments: id);
  }

  Future<void> searchTV(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _resetTVList();
    });
  }

  void showedTVAtIndex(int index) {
    if (index < _tvs.length - 1) return;
    _loadNextTVsPage();
  }
}
