// Dart imports:
import 'dart:async';

// Package imports:
import 'package:comics_db_app/core/app_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_container.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';

part 'movie_list_event.dart';

// part 'movie_list_state.dart';
part 'movie_list_state_new.dart';

class MoviePopularListBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();

  MoviePopularListBloc(NewMovieListState initialState) : super(initialState) {
    // on<MovieListEvent>(((event, emit) async {
    //   if (event is MovieListEventLoadNextPage) {
    //     await onMovieListEventLoadNextPage(event, emit);
    //   } else if (event is MovieListEventLoadReset) {
    //     await onMovieListEventLoadReset(event, emit);
    //   } else if (event is MovieListEventSearchMovie) {
    //     await onMovieListEventLoadSearchMovie(event, emit);
    //   }
    // }), transformer: sequential());
    on<LoadNextPageEvent>(onMovieListEventLoadNextPage);
    on<ResetEvent>(onMovieListEventLoadReset);
    on<SearchEvent>(onMovieListEventLoadSearchMovie);
    on<FavoriteItemEvent>(onMovieListFavoriteEvent);
  }

  void onMovieListEventLoadNextPage(LoadNextPageEvent event, Emitter<NewMovieListState> emit) async {
    if (state.isSearchMode) {
      final container = await loadNextPage(
        state.searchMovieContainer,
        (nextPage) async {
          final result =
              await _movieApiClient.searchMovie(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
          return result;
        },
      );
      if (container != null) {
        final newState = state.copyWith(searchMovieContainer: container);
        emit(newState);
      }
    } else {
      final container = await loadNextPage(state.movieContainer, (nextPage) async {
        final result = await _movieApiClient.popularMovie(nextPage, event.locale, Configuration.apiKey);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(movieContainer: container);
        emit(newState);
      }
    }
  }

  Future<MovieListContainer?> loadNextPage(
      MovieListContainer container, Future<MovieResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.movieContainer.currentPage + 1;
    final result = await loader(nextPage);
    final movies = List<Movie>.from(container.movies)..addAll(result.movies);
    final newContainer = container.copyWith(
      movies: movies,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }

  void onMovieListEventLoadReset(ResetEvent event, Emitter<MovieListState> emit) async {
    emit(const MovieListState.initial());
    // TODO fix
    // add(MovieListEventLoadNextPage(event.locale));
  }

  Future<void> onMovieListEventLoadSearchMovie(SearchEvent event, Emitter<MovieListState> emit) async {
    if (state.searchQuery == event.query) return;
    final newState = state.copyWith(searchQuery: event.query, searchMovieContainer: const MovieListContainer.initial());
    emit(newState);
  }

  void onMovieListFavoriteEvent(FavoriteItemEvent event, Emitter<MovieListState> emit) {
    int index = state.movieContainer.movies.getIndex(event.movie);
    final List<Movie> movies = state.movies.map((element) {
      if (element.id == event.movie.id) {
        return event.movie.copyWith(isFavorite: !state.movieContainer.movies[index].isFavorite);
      }
      return element;
    }).toList();
    emit()
  }
}
