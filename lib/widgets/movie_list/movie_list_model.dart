import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  List<Movie> get movies => List.unmodifiable(_movies);
  late DateFormat _dateFormat;
  String _locale = '';

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

// ! - TODO: вынести в отдельный файл
  void setupLocale(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final moviesResponse = await _apiClient.popularMovie(nextPage, _locale);
    _movies.addAll(moviesResponse.movies);
    _currentPage = moviesResponse.page;
    _totalPage = moviesResponse.totalPages;
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

  void showedMovieAtIndex(int index) {
    if (index < _movies.length - 1) return;
    _loadMovies();
  }
}
