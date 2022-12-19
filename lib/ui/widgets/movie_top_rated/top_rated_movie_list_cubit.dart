import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/top_rated_movie_list_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopRatedMovieListCubit extends Cubit<MovieListCubitState> {
  final TopRatedMovieListBloc topRatedMovieListBloc;
  late final StreamSubscription<MovieListState> topRatedMovieListBlocSubscription;
  late DateFormat _dateFormat;
  Timer? searchDebounce;
  var movie = <Movie>[];

  TopRatedMovieListCubit({required this.topRatedMovieListBloc}) : super(MovieListCubitState(movies: const <MovieListData>[], localeTag: '')) {
    Future.microtask(
      () {
        _onState(topRatedMovieListBloc.state);
        topRatedMovieListBlocSubscription = topRatedMovieListBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(MovieListState state) {
    final movies = state.movies.map(_makeListData).toList();
    final newState = this.state.copyWith(movies: movies);
    emit(newState);
  }

  void setupTopRatedMovieLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    topRatedMovieListBloc.add(const MovieListEventLoadReset());
    topRatedMovieListBloc.add(MovieListEventLoadNextPage(locale: localeTag));
  }

  @override
  Future<void> close() {
    topRatedMovieListBlocSubscription.cancel();
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

  void showedTopRatedMovieAtIndex(int index) {
    if (index < state.movies.length - 1) return;
    topRatedMovieListBloc.add(MovieListEventLoadNextPage(locale: state.localeTag));
  }

  void searchTopRatedMovie(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      topRatedMovieListBloc.add(MovieListEventSearchMovie(query: text));
      topRatedMovieListBloc.add(MovieListEventLoadNextPage(locale: state.localeTag));
    });
  }

  void onMovieTap(BuildContext context, int index) {
    final id = movie[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }
}
