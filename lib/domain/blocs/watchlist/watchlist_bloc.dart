import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_container.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_container.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';
import 'package:comics_db_app/domain/entity/trending_all.dart';
import 'package:comics_db_app/domain/entity/trending_all_response.dart';
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
      } else if (event is WatchlistEventLoadReset) {
        await onWatchlistEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onWatchlistEventLoadMovies(WatchlistEventLoadMovies event, Emitter<WatchlistState> emit) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();
    if (state.watchlistContainer.isComplete) return;
    final container = await _loadNextPage(state.watchlistContainer, (nextPage) async {
      // nextPage at the end show for totalResult, may be need to change
      final result = await _watchListApiClient.watchlistMoviesList(nextPage, event.locale, Configuration.apiKey, sessionId, accountId, nextPage);
      return result;
    });
    if (container != null) {
      final newState = state.copyWith(watchlistContainer: container);
      emit(newState);
    }
  }

  Future<void> onWatchlistEventLoadTVs(WatchlistEventLoadTV event, Emitter<WatchlistState> emit) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();
    if (state.watchlistContainer.isComplete) return;
    final container = await _loadNextPage(state.watchlistContainer, (nextPage) async {
      // nextPage at the end show for totalResult, may be need to change
      final result = await _watchListApiClient.watchlistTvsList(nextPage, event.locale, Configuration.apiKey, sessionId, accountId, nextPage);
      return result;
    });
    if (container != null) {
      final newState = state.copyWith(watchlistContainer: container);
      emit(newState);
    }
  }

  Future<void> onWatchlistEventLoadReset(WatchlistEventLoadReset event, Emitter<WatchlistState> emit) async {
    emit(const WatchlistState.initial());
  }

  Future<MovieListContainer?> _loadNextPage(MovieListContainer container, Future<TrendingAllResponse> Function(int) loader) async {
    var currentPage = state.watchlistContainer.currentPage;
    if (container.isComplete) return null;
    final nextPage = currentPage + 1;
    if (currentPage > 0) return null;
    final result = await loader(nextPage);
    final watchlist = List<TrendingAll>.from(container.watchlist)..addAll(result.trendingAll);
    final newContainer = container.copyWith(
      watchlist: watchlist,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }
}

// Future<WatchlistContainer?> _loadNextPageTVs(WatchlistContainer container, Future<TrendingAllResponse> Function(int) loader) async {
//   var currentPage = state.watchlistContainer.currentPage;
//   if (container.isComplete) return null;
//   final nextPage = currentPage + 1;
//   if (currentPage > 0) return null;
//   final result = await loader(nextPage);
//   final watchlist = List<TrendingAll>.from(container.watchlist)..addAll(result.trendingAll);
//   final newContainer = container.copyWith(
//     watchlist: watchlist,
//     currentPage: result.page,
//     totalPage: result.totalPages,
//   );
//   return newContainer;
// }
// }
