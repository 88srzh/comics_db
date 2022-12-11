import 'package:comics_db_app/domain/blocs/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv.dart';

class TvListState {
  final TvListContainer tvContainer;
  final TvListContainer searchTvContainer;
  final String searchQuery;

  bool get isSearchMode => searchQuery.isNotEmpty;

  List<TV> get tvs => isSearchMode ? searchTvContainer.tvs : tvContainer.tvs;

  TvListState.initial()
      : tvContainer = const TvListContainer.initial(),
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
