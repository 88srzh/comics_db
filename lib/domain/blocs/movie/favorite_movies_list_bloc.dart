// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
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

class FavoriteMovieListBloc extends Bloc<FavoriteMoviesListEvent, FavoriteMovieListState> {
  final _movieApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final bloc = MoviePopularListBloc(const MovieListState.initial());

  FavoriteMovieListBloc(FavoriteMovieListState initialState) : super(initialState) {
    on<FavoriteMoviesListEvent>(((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onFavoriteMoviesListEventLoadNextPage(event, emit);
        // } else if (event is MovieListEventLoadReset) {
        //   await bloc.onMovieListEventLoadReset(event, emit);
        // } else if (event is MovieListEventSearchMovie) {
        //   await bloc.onMovieListEventLoadSearchMovie(event, emit);
      }
    }), transformer: sequential());
  }

  Future<FavoriteMovieListState> loadFavoriteMovies(List<Movie> movies,
      Future<MovieResponse> Function(int) loader) async {
    // if (container.isComplete) return null;
    final totalResults = state.totalResults;
    final result = await loader(totalResults);
    final movies = List<Movie>.from(state.movies)
      ..addAll(result.movies);
    final newMovies = FavoriteMovieListState(movies: movies, totalResults: totalResults).copyWith(
      movies: movies,
      totalResults: result.totalResults,
    );
    return newMovies;
  }

  Future<void> onFavoriteMoviesListEventLoadNextPage(FavoriteMoviesListEventLoadFavoriteMoviesTotalResults event,
      Emitter<FavoriteMovieListState> emit) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();
    final newMovies = await loadFavoriteMovies(List<Movie> movies, (totalResults) async {
      final result = await _movieApiClient.favoriteMoviesList(
          totalResults, event.locale, Configuration.apiKey, sessionId, accountId);
      return result;
    });
    final newState = state.copyWith(movies: newMovies);
    emit(newState);
  }
}
