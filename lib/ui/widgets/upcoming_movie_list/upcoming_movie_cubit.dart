// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/upcoming_movie_list_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit_state.dart';

class UpcomingMovieListCubit extends Cubit<MovieListCubitState> {
  final UpcomingMovieListBloc upcomingMovieListBloc;
  late final StreamSubscription<MovieListState> upcomingMovieListBlocSubscription;
  late DateFormat _dateFormat;
  Timer? searchDebounce;

  UpcomingMovieListCubit({required this.upcomingMovieListBloc})
      : super(MovieListCubitState(movies: const <MovieListData>[], localeTag: '', totalResults: 0)) {
    Future.microtask(() {
      _onState(upcomingMovieListBloc.state);
      upcomingMovieListBlocSubscription = upcomingMovieListBloc.stream.listen(_onState);
    });
  }

  void _onState(MovieListState state) {
    final movies = state.movies.map(_makeListData).toList();
    final newState = this.state.copyWith(movies: movies);
    emit(newState);
  }

  void setupUpcomingMovieLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    upcomingMovieListBloc.add(const MovieListEventLoadReset());
    upcomingMovieListBloc.add(MovieListEventLoadNextPage(locale: localeTag));
  }

  @override
  Future<void> close() {
    upcomingMovieListBlocSubscription.cancel();
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

  void showedUpcomingMovieAtIndex(int index) {
    if (index < state.movies.length - 1) return;
    upcomingMovieListBloc.add(MovieListEventLoadNextPage(locale: state.localeTag));
  }

  void searchUpcomingMovie(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      upcomingMovieListBloc.add(MovieListEventSearchMovie(query: text));
      upcomingMovieListBloc.add(MovieListEventLoadNextPage(locale: state.localeTag));
    });
  }

  void onMovieTap(BuildContext context, int index) {
    final id = state.movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }
}
