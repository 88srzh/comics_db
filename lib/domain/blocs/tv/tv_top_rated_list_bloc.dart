// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_container.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/domain/entity/tv_response.dart';

class TvTopRatedListBloc extends Bloc<TvListEvent, TvListState> {
  final _tvApiClient = MovieAndTvApiClient();

  TvTopRatedListBloc(super.initialState) {
    on<TvListEvent>(((event, emit) async {
      if (event is TvListEventLoadNextPage) {
        await onTvListEventLoadNextPage(event, emit);
      } else if (event is TvListEventLoadReset) {
        await onTvListEventLoadReset(event, emit);
      } else if (event is TvListEventSearchTv) {
        await onTvListEventLoadSearchTv(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onTvListEventLoadNextPage(TvListEventLoadNextPage event, Emitter<TvListState> emit) async {
    if (state.isSearchMode) {
      final container = await _loadNextPage(state.searchTvContainer, (nextPage) async {
        final result = await _tvApiClient.searchTV(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(searchTvContainer: container);
        emit(newState);
      }
    } else {
      final container = await _loadNextPage(state.tvContainer, (nextPage) async {
        final result = await _tvApiClient.discoverTopRatedTV(nextPage, event.locale, Configuration.apiKey, false, false, 'vote_average.desc', 200);
        return result;
      });
      if (container != null) {
        final newSate = state.copyWith(tvContainer: container);
        emit(newSate);
      }
    }
  }

  Future<TvListContainer?> _loadNextPage(TvListContainer container, Future<TVResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.tvContainer.currentPage + 1;
    final result = await loader(nextPage);
    final tvs = List<TV>.from(container.tvs)..addAll(result.tvs);
    final newContainer = container.copyWith(
      tvs: tvs,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }

  Future<void> onTvListEventLoadReset(TvListEventLoadReset event, Emitter<TvListState> emit) async {
    emit(const TvListState.initial());
  }

  Future<void> onTvListEventLoadSearchTv(TvListEventSearchTv event, Emitter<TvListState> emit) async {
    if (state.searchQuery == event.query) return;
    final newState = state.copyWith(searchQuery: event.query, searchTvContainer: const TvListContainer.initial());
    emit(newState);
  }
}
