// Package imports:
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_state.dart';
import 'package:comics_db_app/domain/entity/popular_tv_response.dart';
import 'package:comics_db_app/domain/entity/tv.dart';

abstract class TvListEvent {}

class TvListEventLoadNextPage extends TvListEvent {
  final String locale;

  TvListEventLoadNextPage(this.locale);
}

class TvListEventLoadReset extends TvListEvent {}

class TvListEventSearchTv extends TvListEvent {
  final String query;

  TvListEventSearchTv(this.query);
}

class TvListContainer {
  final List<TV> tvs;
  final int currentPage;
  final int totalPage;

  bool get isComplete => currentPage >= totalPage;

  const TvListContainer.initial()
      : tvs = const <TV>[],
        currentPage = 0,
        totalPage = 1;

  TvListContainer({required this.tvs, required this.currentPage, required this.totalPage});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvListContainer &&
          runtimeType == other.runtimeType &&
          tvs == other.tvs &&
          currentPage == other.currentPage &&
          totalPage == other.totalPage;

  @override
  int get hashCode => tvs.hashCode ^ currentPage.hashCode ^ totalPage.hashCode;

  TvListContainer copyWith({
    List<TV>? tvs,
    int? currentPage,
    int? totalPage,
  }) {
    return TvListContainer(
      tvs: tvs ?? this.tvs,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
    );
  }
}

class TvPopularListBloc extends Bloc<TvListEvent, TvListState> {
  final _tvApiClient = MovieAndTvApiClient();

  TvPopularListBloc(TvListState initialState) : super(initialState) {
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
        final result = await _tvApiClient.popularTV(nextPage, event.locale, Configuration.apiKey);
        return result;
      });
      if (container != null) {
        final newSate = state.copyWith(tvContainer: container);
        emit(newSate);
      }
    }
  }

  Future<TvListContainer?> _loadNextPage(
      TvListContainer container, Future<PopularTVResponse> Function(int) loader) async {
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
    emit(TvListState.initial());
  }

  Future<void> onTvListEventLoadSearchTv(TvListEventSearchTv event, Emitter<TvListState> emit) async {
    if (state.searchQuery == event.query) return;
    final newState = state.copyWith(searchQuery: event.query, searchTvContainer: const TvListContainer.initial());
    emit(newState);
  }
}
