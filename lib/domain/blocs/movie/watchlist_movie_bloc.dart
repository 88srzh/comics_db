// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_container.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';

class WatchlistMovieBloc extends Bloc<MovieListEvent, MovieListState> {
  final _watchListApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();

  WatchlistMovieBloc(MovieListState initialState) : super(initialState) {
    on<MovieListEvent>(((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onWatchlistEventLoadMovies(event, emit);
      } else if (event is MovieListEventLoadReset) {
        await onWatchlistEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onWatchlistEventLoadMovies(MovieListEventLoadNextPage event, Emitter<MovieListState> emit) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();
    if (state.movieContainer.isComplete) return;
    final container = await _loadNextPage(state.movieContainer, (nextPage) async {
      // TODO nextPage at the end show for totalResult, may be need to change
      final result = await _watchListApiClient.watchlistMoviesList(nextPage, event.locale, Configuration.apiKey, sessionId, accountId, nextPage);
      return result;
    });
    if (container != null) {
      final movieNewState = state.copyWith(movieContainer: container);
      emit(movieNewState);
    }
  }

  Future<void> onWatchlistEventLoadReset(MovieListEventLoadReset event, Emitter<MovieListState> emit) async {
    emit(const MovieListState.initial());
  }

  Future<MovieListContainer?> _loadNextPage(MovieListContainer container, Future<MovieResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.movieContainer.currentPage + 1;
    final result = await loader(nextPage);
    final watchlist = List<Movie>.from(container.movies)..addAll(result.movies);
    final newContainer = container.copyWith(
      movies: watchlist,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }
}
