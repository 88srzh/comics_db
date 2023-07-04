// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_container.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/tv_response.dart';
import 'package:comics_db_app/domain/entity/tv.dart';

class FavoriteTvListBloc extends Bloc<TvListEvent, TvListState> {
  final _movieApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();

  FavoriteTvListBloc(TvListState initialState) : super(initialState) {
    on<TvListEvent>(((event, emit) async {
      if (event is TvListEventLoadNextPage) {
        await onFavoriteTvsListEventLoadNextPage(event, emit);
      } else if (event is TvListEventLoadReset) {
        await onFavoriteTvsListEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<TvListContainer?> loadFavoriteTvs(
      TvListContainer container, Future<TVResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.tvContainer.currentPage + 1;
    final result = await loader(nextPage);
    final tvs = List<TV>.from(container.tvs)..addAll(result.tvs);
    final newContainer = container.copyWith(
      tvs: tvs,
      currentPage: result.page,
      totalPage: result.page,
      totalResults: result.totalResults,
    );
    return newContainer;
  }

  Future<void> onFavoriteTvsListEventLoadNextPage(
      TvListEventLoadNextPage event, Emitter<TvListState> emit) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();
    final container = await loadNextPage(state.tvContainer, (nextPage) async {
      final result = await _movieApiClient.favoriteTvsList(
          nextPage, event.locale, Configuration.apiKey, sessionId, accountId, nextPage);
      return result;
    });
    if (container != null) {
      final newState = state.copyWith(tvContainer: container);
      emit(newState);
    }
  }

  Future<TvListContainer?> loadNextPage(
      TvListContainer container, Future<TVResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.tvContainer.currentPage + 1;
    final result = await loader(nextPage);
    final tvs = List<TV>.from(container.tvs)..addAll(result.tvs);
    final newContainer = container.copyWith(
      tvs: tvs,
      currentPage: result.page,
      totalPage: result.totalPages,
      totalResults: result.totalResults,
    );
    return newContainer;
  }

  Future<void> onFavoriteTvsListEventLoadReset(TvListEventLoadReset event, Emitter<TvListState> emit) async {
    emit(const TvListState.initial());
  }
}
