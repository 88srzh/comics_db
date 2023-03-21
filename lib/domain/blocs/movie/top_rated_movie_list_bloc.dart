/*
// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';

class TopRatedMovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();
  final bloc = MoviePopularListBloc(const MovieListState.initial());

  TopRatedMovieListBloc(MovieListState initialState) : super(initialState) {
    on<MovieListEvent>(((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onTopRatedMovieListEventLoadNextPage(event, emit);
      } else if (event is MovieListEventLoadReset) {
        await bloc.onMovieListEventLoadReset(event, emit);
      } else if (event is MovieListEventSearchMovie) {
        await bloc.onMovieListEventLoadSearchMovie(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onTopRatedMovieListEventLoadNextPage(
      MovieListEventLoadNextPage event, Emitter<MovieListState> emit) async {
    if (state.isSearchMode) {
      final container = await bloc.loadNextPage(
        state.searchMovieContainer,
        (nextPage) async {
          final result = await _movieApiClient.searchMovie(
              nextPage, event.locale, state.searchQuery, Configuration.apiKey);
          return result;
        },
      );
      if (container != null) {
        final newState = state.copyWith(searchMovieContainer: container);
        emit(newState);
      }
    } else {
      final container =
          await bloc.loadNextPage(state.movieContainer, (nextPage) async {
        final result = await _movieApiClient.topRatedMovie(
            nextPage, event.locale, Configuration.apiKey);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(movieContainer: container);
        emit(newState);
      }
    }
  }
}
*/
