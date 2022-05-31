import 'dart:async';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/library/paginator.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/localized_model_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieListData {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final String originalTitle;
  final String overview;
  final String releaseDate;

  MovieListData({
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
  });
}

class MovieListViewModel extends ChangeNotifier {
  final _movieService = MovieService();
  late final Paginator<Movie> _popularMoviePaginator;
  late final Paginator<Movie> _searchMoviePaginator;

  // late final Paginator<Movie> _nowPlayingMoviePaginator;

  // late final Paginator<Movie> _similarMoviePaginator;
  Timer? searchDebounce;
  final _localeStorage = LocalizedModelStorage();
  var _movies = <MovieListData>[];
  String? _searchQuery;

  bool get isSearchMode {
    final searchQuery = _searchQuery;
    return searchQuery != null && searchQuery.isNotEmpty;
  }

  List<MovieListData> get movies => List.unmodifiable(_movies);
  late DateFormat _dateFormat;

  MovieListViewModel() {
    _popularMoviePaginator = Paginator<Movie>(
      (page) async {
        final result = await _movieService.popularMovie(page, _localeStorage.localeTag);
        return PaginatorLoadResult(
          data: result.movies,
          currentPage: result.page,
          totalPage: result.totalPages,
        );
      },
    );

    // _nowPlayingMoviePaginator = Paginator<Movie>(
    //   (page) async {
    //     final result = await _movieService.nowPlayingMovie(page, _localeStorage.localeTag);
    //     return PaginatorLoadResult(
    //       data: result.movies,
    //       currentPage: result.page,
    //       totalPage: result.totalPages,
    //     );
    //   },
    // );

    _searchMoviePaginator = Paginator<Movie>(
      (page) async {
        final result = await _movieService.searchMovie(page, _localeStorage.localeTag, _searchQuery ?? '');
        return PaginatorLoadResult(
          data: result.movies,
          currentPage: result.page,
          totalPage: result.totalPages,
        );
      },
    );
  }

// ! - TODO: вынести в отдельный файл
  Future<void> setupPopularMovieLocale(Locale locale) async {
    if (!_localeStorage.updateLocale(locale)) return;
    _dateFormat = DateFormat.yMMMd(_localeStorage.localeTag);
    await _resetPopularMovieList();
  }

  Future<void> _resetPopularMovieList() async {
    await _popularMoviePaginator.reset();
    await _searchMoviePaginator.reset();
    _movies.clear();
    await _loadNextPopularMoviesPage();
  }

// TODO: move to a separate file
  MovieListData _makeListData(Movie movie) {
    final releaseDate = movie.releaseDate;
    final releaseDateTitle = releaseDate != null ? _dateFormat.format(releaseDate) : '';
    return MovieListData(
      title: movie.title,
      posterPath: movie.posterPath,
      backdropPath: movie.backdropPath,
      id: movie.id,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      releaseDate: releaseDateTitle,
    );
  }

  Future<void> _loadNextPopularMoviesPage() async {
    if (isSearchMode) {
      await _searchMoviePaginator.loadNextMoviesPage();
      _movies = _searchMoviePaginator.data.map(_makeListData).toList();
    } else {
      await _popularMoviePaginator.loadNextMoviesPage();
      _movies = _popularMoviePaginator.data.map(_makeListData).toList();
    }
    notifyListeners();
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  void onFullCastAndCrewTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.fullCastAndCrew, arguments: id);
  }

  Future<void> searchPopularMovie(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(
      const Duration(milliseconds: 300),
      () async {
        final searchQuery = text.isNotEmpty ? text : null;
        if (_searchQuery == searchQuery) return;
        _searchQuery = searchQuery;
        _movies.clear();
        if (isSearchMode) {
          await _searchMoviePaginator.reset();
        }
        _loadNextPopularMoviesPage();
      },
    );
  }

// TODO: add now playing movie search

  void showedPopularMovieAtIndex(int index) {
    if (index < _movies.length - 1) return;
    _loadNextPopularMoviesPage();
  }
}
