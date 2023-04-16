// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_container.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_movies_list_bloc.freezed.dart';

part 'favorite_movies_list_event.dart';

part 'favorite_movies_list_state.dart';

class FavoriteMovieListBloc extends Bloc<FavoriteMoviesListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final bloc = MoviePopularListBloc(const MovieListState.initial());

  FavoriteMovieListBloc(MovieListState initialState) : super(initialState) {
    on<FavoriteMoviesListEvent>(((event, emit) async {
      if (event is FavoriteMoviesListEventLoadFavoriteMoviesTotalResults) {
        await onFavoriteMoviesListEventLoadNextPage(event, emit);
      } else if (event is FavoriteMoviesListEventLoadReset) {
        await onFavoriteMoviesListEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  // Future<MovieListState> loadFavoriteMovies(List<Movie> movies, Future<MovieResponse> Function(int) loader) async {
  // if (container.isComplete) return null;
  // final totalResults = state.movieContainer.totalResults;
  // final result = await loader(totalResults);
  // final movies = List<Movie>.from(state.movies)..addAll(result.movies);
  // final newMovies = MovieListState(movies: movies, totalResults: totalResults).copyWith(
  //   movies: movies,
  //   totalResults: result.totalResults,
  // );
  // return newMovies;
  // }
  Future<MovieListContainer?> loadFavoriteMovies(
      MovieListContainer container, Future<MovieResponse> Function(int) loader) async {
    final totalResults = state.movieContainer.totalResults;
    final result = await loader(totalResults);
    final movies = List<Movie>.from(container.movies)..addAll(result.movies);
    final newContainer = container.copyWith(
      movies: movies,
      totalResults: result.totalResults,
    );
    return newContainer;
  }

  Future<void> onFavoriteMoviesListEventLoadNextPage(
      FavoriteMoviesListEventLoadFavoriteMoviesTotalResults event, Emitter<MovieListState> emit) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();
    final newMovies = await loadNextPage(state.movieContainer, (totalResults) async {
      final result = await _movieApiClient.favoriteMoviesList(
          totalResults, event.locale, Configuration.apiKey, sessionId, accountId);
      return result;
    });
    if (newMovies != null) {
      final newState = state.copyWith(movieContainer: newMovies);
      emit(newState);
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
      totalResults: result.totalResults,
    );
    return newContainer;
  }

  Future<void> onFavoriteMoviesListEventLoadReset(
      FavoriteMoviesListEventLoadReset event, Emitter<MovieListState> emit) async {
    emit(const MovieListState.initial());
    // add(const MovieListEventLoadReset());
  }
}
