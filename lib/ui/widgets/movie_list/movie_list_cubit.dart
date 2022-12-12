import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_event.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_state.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// TODO refactoring title
class MoviePopularListCubit extends Cubit<MovieListCubitState> {
  final MoviePopularListBloc movieListBloc;
  late final StreamSubscription<MovieListState> movieListBlocSubscription;
  late DateFormat _dateFormat;
  Timer? searchDebounce;
  var mov = <Movie>[];

  MoviePopularListCubit({required this.movieListBloc})
      : super(MovieListCubitState(movies: const <MovieListData>[], localeTag: '')) {
    Future.microtask(
      () {
        _onState(movieListBloc.state);
        movieListBlocSubscription = movieListBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(MovieListState state) {
    final movies = state.movies.map(_makeListData).toList();
    final newState = this.state.copyWith(movies: movies);
    emit(newState);
  }

  void setupPopularMovieLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    movieListBloc.add(MovieListEventLoadReset());
    movieListBloc.add(MovieListEventLoadNextPage(localeTag));
  }

  @override
  Future<void> close() {
    movieListBlocSubscription.cancel();
    return super.close();
  }

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

  void showedPopularMovieAtIndex(int index) {
    if (index < state.movies.length - 1) return;
    movieListBloc.add(MovieListEventLoadNextPage(state.localeTag));
  }

  void searchPopularMovie(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(
      const Duration(milliseconds: 300),
      () async {
        movieListBloc.add(MovieListEventSearchMovie(text));
        movieListBloc.add(MovieListEventLoadNextPage(state.localeTag));
      },
    );
  }

  void onMovieTap(BuildContext context, int index) {
    final id = state.movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }
}
