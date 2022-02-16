
import 'dart:async';

import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/popular_and_top_rated_movie_response.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class UpcomingMovieModel extends ChangeNotifier {
  final _apiClient = MovieAndTvApiClient();
  final _movies = <Movie>[];
  // final _dates = <MovieDates>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  String? _searchQuery;
  String _locale = '';
  Timer? searchDebounce;

  List<Movie> get movies => List.unmodifiable(_movies);
  late DateFormat _dateFormat;

  // List<MovieDates> get dates => List.unmodifiable(_dates);

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

// ! - TODO: вынести в отдельный файл
  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    await _resetUpcomingMovieList();
  }

  Future<void> _resetUpcomingMovieList() async {
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear();
    await _loadNextUpcomingMoviesPage();
  }

  Future<PopularAndTopRatedMovieResponse> _loadUpcomingMovies(int nextPage, String locale) async {
    final query = _searchQuery;
    if (query == null) {
      return await _apiClient.upcomingMovie(nextPage, _locale);
    } else {
      // return await _apiClient.searchUpcomingMovie(nextPage, _locale, query);
      return await _apiClient.searchUpcomingMovie(nextPage, _locale, query);
    }

  }

  Future<void> _loadNextUpcomingMoviesPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final upcomingMoviesResponse = await _loadUpcomingMovies(nextPage, _locale);
      _movies.addAll(upcomingMoviesResponse.movies);
      // _dates.addAll(upcomingMoviesResponse.dates);
      _currentPage = upcomingMoviesResponse.page;
      _totalPage = upcomingMoviesResponse.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  void onFullCastAndCrewTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.fullCastAndCrew, arguments: id);
  }

  Future<void> searchMovie(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if(_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _resetUpcomingMovieList();
    });
  }

  void showedMovieAtIndex(int index) {
    if (index < _movies.length - 1) return;
    _loadNextUpcomingMoviesPage();
  }
}