import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_container.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/domain/entity/tv_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// part 'tv_discover_popular_list_bloc.freezed.dart';

// part 'tv_list_event.dart';

// part 'tv_list_state.dart';

class TvDiscoverPopularListBloc extends Bloc<TvListEvent, TvListState> {
  final _tvApiClient = MovieAndTvApiClient();

  TvDiscoverPopularListBloc(TvListState initialState) : super(initialState) {
    on<TvListEvent>(((event, emit) async {
      if (event is TvListEventLoadNextPage) {
        await onDiscoverPopularTvListEventLoadNextPage(event, emit);
      } else if (event is TvListEventLoadReset) {
        await onDiscoverPopularTvListEventLoadReset(event, emit);
      } else if (event is TvListEventSearchTv) {
        await onDiscoverPopularTvListEventLoadSearchTv(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onDiscoverPopularTvListEventLoadNextPage(TvListEventLoadNextPage event, Emitter<TvListState> emit) async {
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
        final result = await _tvApiClient.discoverPopularTV(nextPage, event.locale, Configuration.apiKey, false, false, 'popularity.desc');
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(tvContainer: container);
        emit(newState);
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
      totalResults: result.totalResults,
    );
    return newContainer;
  }

  Future<void> onDiscoverPopularTvListEventLoadReset(TvListEventLoadReset event, Emitter<TvListState> emit) async {
    emit(const TvListState.initial());
  }

  Future<void> onDiscoverPopularTvListEventLoadSearchTv(TvListEventSearchTv event, Emitter<TvListState> emit) async {
    if (state.searchQuery == event.query) return;
    final newState = state.copyWith(searchQuery: event.query, searchTvContainer: const TvListContainer.initial());
    emit(newState);
  }
}
