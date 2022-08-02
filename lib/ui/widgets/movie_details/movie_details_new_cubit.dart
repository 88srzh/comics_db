import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/movie_details_new_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'movie_details_new_state.dart';

class MovieDetailsNewCubit extends Cubit<MovieDetailsCubitNewState> {
  final MovieDetailsNewBloc movieDetailsNewBloc;
  late final StreamSubscription<MovieDetailsNewState> movieDetailsBlocSubscription;
  late DateFormat _dateFormat;
  var mov = <Movie>[];
  // final overview = '';

  MovieDetailsNewCubit({required this.movieDetailsNewBloc})
      : super(MovieDetailsCubitNewState(movies: const <MovieListData>[], localeTag: '')) {
    Future.microtask(() {
      _onState(movieDetailsNewBloc.state);
      movieDetailsBlocSubscription = movieDetailsNewBloc.stream.listen(_onState);
    });
  }


  void _onState(MovieDetailsNewState state) {
    // final movies = state.detailsMovie.map(_makeDetailsListData).toList();
    final movies = state.detailsMovie.map(updateData).toList();
    final newState = this.state.copyWith(movies: movies);
    emit(newState);
  }

  void setupMovieDetailsLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    // не уверен, что first правильно передаст id
    // movieDetailsNewBloc.add(MovieDetailsNewEventLoadDetailsPage(localeTag, state.movies[index].id));
  }

  @override
  Future<void> close() {
    movieDetailsBlocSubscription.cancel();
    return super.close();
  }

  MovieListData _makeDetailsListData(Movie movie) {
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

  void onMovieTap(BuildContext context, int index) {
    var movies = <MovieListData>[];
    final id = movies[index].id;
    // final id = mov[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  MovieListData updateData(Movie movie) {
    final releaseDate = movie.releaseDate;
    final releaseDateTitle = releaseDate != null ? _dateFormat.format(releaseDate) : '';
    return MovieListData(
        title: movie.title,
        posterPath: movie.posterPath,
        backdropPath: movie.backdropPath,
        id: movie.id,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        releaseDate: releaseDateTitle,);
  }
}
