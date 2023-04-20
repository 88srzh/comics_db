// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/favorite_movies_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit_state.dart';

class FavoriteMovieListCubit extends Cubit<MovieListCubitState> {
  final FavoriteMovieListBloc favoriteMovieListBloc;
  late final StreamSubscription<MovieListState> favoriteMoveListBlocSubscription;
  late DateFormat _dateFormat;
  Timer? searchDebounce;
  var movie = <Movie>[];

  FavoriteMovieListCubit({required this.favoriteMovieListBloc})
      : super(MovieListCubitState(movies: const <MovieListData>[], localeTag: '', totalResults: 0)) {
    Future.microtask(
      () {
        _onState(favoriteMovieListBloc.state);
        favoriteMoveListBlocSubscription = favoriteMovieListBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(MovieListState state) {
    final movies = state.movies.map(_makeListData).toList();
    final newState = this.state.copyWith(movies: movies);
    emit(newState);
  }

  void setupFavoriteMovieLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    favoriteMovieListBloc.add(const MovieListEventLoadReset());
    favoriteMovieListBloc.add(MovieListEventLoadNextPage(locale: localeTag));
  }

  void updateFavoriteMovies(String localeTag) {
    favoriteMovieListBloc.add(const MovieListEventLoadReset());
    favoriteMovieListBloc.add(MovieListEventLoadNextPage(locale: localeTag));
  }

  @override
  Future<void> close() {
    favoriteMoveListBlocSubscription.cancel();
    return super.close();
  }

  // TODO may be unite in one class
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

  void showedFavoriteMovieAtIndex(int index) {
    if (index < state.movies.length - 1) return;
    favoriteMovieListBloc.add(MovieListEventLoadNextPage(locale: state.localeTag));
  }

/*
  void searchFavoriteMovie(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      favoriteMovieListBloc.add(MovieListEventSearchMovie(query: text));
      favoriteMovieListBloc.add(MovieListEventLoadNextPage(locale: state.localeTag));
    });
  }
*/

  void onMovieTap(BuildContext context, int index) {
    final id = movie[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }
}
