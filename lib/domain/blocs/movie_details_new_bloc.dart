/*
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'movie_details_new_event.dart';

part 'movie_details_new_state.dart';

class MovieDetailsContainer {
  final String overview;

  const MovieDetailsContainer.initial() : overview = '';

  const MovieDetailsContainer({
    required this.overview,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsContainer && runtimeType == other.runtimeType && overview == other.overview;

  @override
  int get hashCode => overview.hashCode;

  MovieDetailsContainer copyWith({
    String? overview,
  }) {
    return MovieDetailsContainer(
      overview: overview ?? this.overview,
    );
  }
}

class MovieDetailsNewBloc extends Bloc<MovieDetailsNewEvent, MovieDetailsNewState> {
  // final _movieApiClient = MovieAndTvApiClient();
  final _movieService = MovieService();
  // final int movieId;

  MovieDetailsNewBloc(MovieDetailsNewState initialState) : super(initialState) {
    on<MovieDetailsNewEvent>((event, emit) async {
      if (event is MovieDetailsNewEventLoadDetailsPage) {
        await onMovieDetailsNewEventLoadDetailsPage(event, emit);
      }
    }, transformer: sequential());
  }

  Future<void> onMovieDetailsNewEventLoadDetailsPage(MovieDetailsNewEventLoadDetailsPage event, Emitter<MovieDetailsNewState> emit) async {
    // final result = await _movieApiClient.movieDetails(event.movieId, event.locale);
    // final result = await _movieService.loadMovieDetails(movieId: event.movieId, locale: event.locale);
    // updateData();
    // final overview = result.overview;
    // final overview = result.details.overview;
    // скорее всего надо будет расписать переменные для details
    // final result = await _movieApiClient.movieDetails(event.movieId, event.locale);
    // final movies = List<Movie>.from(state.movieDetailsContainer.movies)..addAll(movieResult.movies);
    // final container = state.movieDetailsContainer.copyWith(
    //   overview: overview
    // );
    // final newState = state.copyWith(movieDetailsContainer: container);
    // emit(newState);
  }
}
*/
