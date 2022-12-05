

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
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

  const TvListContainer.initial() : tvs = const <TV>[], currentPage = 0, totalPage = 1;

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

class TvListState {
  final TvListContainer tvContainer;
  final TvListContainer searchTvContainer;
  final String searchQuery;

  bool get isSearchMode => searchQuery.isNotEmpty;

  List<TV> get tvs => isSearchMode ? searchTvContainer.tvs : tvContainer.tvs;

  TvListState.initial() : tvContainer = const TvListContainer.initial(),
  searchTvContainer = const TvListContainer.initial(),
  searchQuery = '';

  TvListState({
    required this.tvContainer,
    required this.searchTvContainer,
    required this.searchQuery,
});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvListState &&
          runtimeType == other.runtimeType &&
          tvContainer == other.tvContainer &&
          searchTvContainer == other.searchTvContainer &&
          searchQuery == other.searchQuery;

  @override
  int get hashCode => tvContainer.hashCode ^ searchTvContainer.hashCode ^ searchQuery.hashCode;

  TvListState copyWith({
    TvListContainer? tvContainer,
    TvListContainer? searchTvContainer,
    String? searchQuery,
  }) {
    return TvListState(
      tvContainer: tvContainer ?? this.tvContainer,
      searchTvContainer: searchTvContainer ?? this.searchTvContainer,
      searchQuery: searchQuery ?? this.searchQuery,
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
}