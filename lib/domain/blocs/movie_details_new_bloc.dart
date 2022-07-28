import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:meta/meta.dart';

part 'movie_details_new_event.dart';

part 'movie_details_new_state.dart';

class MovieDetailsContainer {
  final List<Movie> movies;

  const MovieDetailsContainer.initial() : movies = const <Movie>[];

  const MovieDetailsContainer({
    required this.movies,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsContainer && runtimeType == other.runtimeType && movies == other.movies;

  @override
  int get hashCode => movies.hashCode;

  MovieDetailsContainer copyWith({
    List<Movie>? movies,
  }) {
    return MovieDetailsContainer(
      movies: movies ?? this.movies,
    );
  }
}

class MovieDetailsNewBloc extends Bloc<MovieDetailsNewEvent, MovieDetailsNewState> {
  final _movieApiClient = MovieAndTvApiClient();

  MovieDetailsNewBloc(MovieDetailsNewState initialState) : super(initialState) {
    on<MovieDetailsNewEvent>((event, emit) async {
      if (event is MovieDetailsNewEventLoadDetailsPage) {
        await onMovieDetailsNewEventLoadDetailsPage(event, emit);
      }
    }, transformer: sequential());
  }

  Future<void> onMovieDetailsNewEventLoadDetailsPage(MovieDetailsNewEventLoadDetailsPage event, Emitter<MovieDetailsNewState> emit) async {
    // не уверен, что верно так добавлять nextPage
    final nextPage = 0;
    final movieResult = await _movieApiClient.popularMovie(nextPage, event.locale, Configuration.apiKey);
    // скорее всего надо будет расписать переменные для details
    final result = await _movieApiClient.movieDetails(event.movieId, event.locale);
    final movies = List<Movie>.from(state.movieDetailsContainer.movies)..addAll(movieResult.movies);
    final container =state.movieDetailsContainer.copyWith(
      movies: movies,
    );
    final newState = state.copyWith(movieDetailsContainer: container);
    emit(newState);
  }
}
