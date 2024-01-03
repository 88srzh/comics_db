// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_container.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:intl/intl.dart';

class NowPlayingMovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();

  // TODO duplicate in other places

  NowPlayingMovieListBloc(MovieListState initialState) : super(initialState) {
    on<MovieListEvent>(((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onNowPlayingMovieListEventLoadNextPage(event, emit);
      } else if (event is MovieListEventLoadReset) {
        await onNowPlayingMovieListEventLoadReset(event, emit);
      } else if (event is MovieListEventSearchMovie) {
        await onNowPlayingMovieListEventLoadSearchMovie(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onNowPlayingMovieListEventLoadNextPage(MovieListEventLoadNextPage event, Emitter<MovieListState> emit) async {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String maximumDateTime = dateFormat.format(DateTime.now());
    String minimumDate = '1970-01-01';
    if (state.isSearchMode) {
      final container = await loadNextPage(state.searchMovieContainer, (nextPage) async {
        final result = await _movieApiClient.searchMovie(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(searchMovieContainer: container);
        emit(newState);
      }
    } else {
      final container = await loadNextPage(state.movieContainer, (nextPage) async {
        final result = await _movieApiClient.discoverNowPlayingMovie(
            nextPage, event.locale, Configuration.apiKey, false, false, 'popularity.desc', 3, minimumDate, maximumDateTime);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(movieContainer: container);
        emit(newState);
      }
    }
  }

  Future<MovieListContainer?> loadNextPage(MovieListContainer container, Future<MovieResponse> Function(int) loader) async {
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

  Future<void> onNowPlayingMovieListEventLoadReset(MovieListEventLoadReset event, Emitter<MovieListState> emit) async {
    emit(const MovieListState.initial());
  }

  Future<void> onNowPlayingMovieListEventLoadSearchMovie(MovieListEventSearchMovie event, Emitter<MovieListState> emit) async {
    if (state.searchQuery == event.query) return;
    final newState = state.copyWith(searchQuery: event.query, searchMovieContainer: const MovieListContainer.initial());
    emit(newState);
  }
}
