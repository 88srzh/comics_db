import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_container.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_container.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/domain/entity/tv_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_bloc.freezed.dart';

part 'watchlist_event.dart';

part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final _watchListApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();

  WatchlistBloc(WatchlistState initialState) : super(initialState) {
    on<WatchlistEvent>(((event, emit) async {
      if (event is WatchlistEventLoadMovies) {
        await onWatchlistEventLoadMovies(event, emit);
      } else if (event is WatchlistEventLoadTV) {
        await onWatchlistEventLoadTVs(event, emit);
      } else if (event is WatchlistLoadReset) {
        await onWatchlistEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onWatchlistEventLoadMovies(WatchlistEventLoadMovies event, Emitter<WatchlistState> emit) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();
    if (state.movieListContainer.isComplete) return;
    final container = await _loadNextPageMovies(state.movieListContainer, (nextPage) async {
      // nextPage at the end show for totalResult, may be need to change
      final result = await _watchListApiClient.watchlistMoviesList(nextPage, event.locale, Configuration.apiKey, sessionId, accountId, nextPage);
      return result;
    });
    if (container != null) {
      final newState = state.copyWith(movieListContainer: container);
      emit(newState);
    }
  }

  Future<void> onWatchlistEventLoadTVs(WatchlistEventLoadTV event, Emitter<WatchlistState> emit) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();
    if (state.movieListContainer.isComplete) return;
    final container = await _loadNextPageTVs(state.tvListContainer, (nextPage) async {
      // nextPage at the end show for totalResult, may be need to change
      final result = await _watchListApiClient.watchlistTvsList(nextPage, event.locale, Configuration.apiKey, sessionId, accountId, nextPage);
      return result;
    });
    if (container != null) {
      final newState = state.copyWith(tvListContainer: container);
      emit(newState);
    }
  }

  Future<void> onWatchlistEventLoadReset(WatchlistLoadReset event, Emitter<WatchlistState> emit) async {
    emit(const WatchlistState.initial());
  }

  Future<MovieListContainer?> _loadNextPageMovies(MovieListContainer container, Future<MovieResponse> Function(int) loader) async {
    var currentPage = state.movieListContainer.currentPage;
    if (container.isComplete) return null;
    final nextPage = currentPage + 1;
    if (currentPage > 0) return null;
    final result = await loader(nextPage);
    final movies = List<Movie>.from(container.movies)..addAll(result.movies);
    final newContainer = container.copyWith(
      movies: movies,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }

  Future<TvListContainer?> _loadNextPageTVs(TvListContainer container, Future<TVResponse> Function(int) loader) async {
    var currentPage = state.tvListContainer.currentPage;
    if (container.isComplete) return null;
    final nextPage = currentPage + 1;
    if (currentPage > 0) return null;
    final result = await loader(nextPage);
    final tvs = List<TV>.from(container.tvs)..addAll(result.tvs);
    final newContainer = container.copyWith(
      tvs: tvs,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }
}
