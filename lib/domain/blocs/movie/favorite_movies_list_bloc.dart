// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';

class FavoriteMovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final int id;
  final bloc = MoviePopularListBloc(const MovieListState.initial());

  FavoriteMovieListBloc(MovieListState initialState, this.id) : super(initialState) {
    on<MovieListEvent>(((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onFavoriteMovieListEventLoadNextPage(event, emit);
      } else if (event is MovieListEventLoadReset) {
        await bloc.onMovieListEventLoadReset(event, emit);
      } else if (event is MovieListEventSearchMovie) {
        await bloc.onMovieListEventLoadSearchMovie(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onFavoriteMovieListEventLoadNextPage(
      MovieListEventLoadNextPage event, Emitter<MovieListState> emit) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();
    if (state.isSearchMode) {
      final container = await bloc.loadNextPage(state.searchMovieContainer, (nextPage) async {
        final result =
            await _movieApiClient.searchMovie(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(searchMovieContainer: container);
        emit(newState);
      }
    } else {
      final container = await bloc.loadNextPage(state.movieContainer, (nextPage) async {
        // final result = await _movieService.loadMovieDetails(movieId: id, locale: event.locale);
        final result = await _movieApiClient.favoriteMoviesList(
            nextPage, event.locale, Configuration.apiKey, sessionId, accountId);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(movieContainer: container);
        emit(newState);
      }
    }
  }
}
