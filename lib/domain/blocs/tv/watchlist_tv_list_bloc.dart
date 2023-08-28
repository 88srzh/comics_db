// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_container.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/domain/entity/tv_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';

class WatchlistTVBloc extends Bloc<TvListEvent, TvListState> {
  final _watchListApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();

  WatchlistTVBloc(TvListState initialState) : super(initialState) {
    on<TvListEvent>(((event, emit) async {
      if (event is TvListEventLoadNextPage) {
        await onWatchlistEventLoadTV(event, emit);
      } else if (event is TvListEventLoadReset) {
        await onWatchlistEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onWatchlistEventLoadTV(TvListEventLoadNextPage event, Emitter<TvListState> emit) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();
    if (state.tvContainer.isComplete) return;
    final container = await _loadNextPage(state.tvContainer, (nextPage) async {
      // TODO nextPage at the end show for totalResult, may be need to change
      final result = await _watchListApiClient.watchlistTvsList(nextPage, event.locale, Configuration.apiKey, sessionId, accountId, nextPage);
      return result;
    });
    if (container != null) {
      final tvNewState = state.copyWith(tvContainer: container);
      emit(tvNewState);
    }
  }

  Future<void> onWatchlistEventLoadReset(TvListEventLoadReset event, Emitter<TvListState> emit) async {
    emit(const TvListState.initial());
  }

  Future<TvListContainer?> _loadNextPage(TvListContainer container, Future<TVResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.tvContainer.currentPage + 1;
    final result = await loader(nextPage);
    final watchlist = List<TV>.from(container.tvs)..addAll(result.tvs);
    final newContainer = container.copyWith(
      tvs: watchlist,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }
}
