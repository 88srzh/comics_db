part of 'tv_popular_list_bloc.dart';

class TvListState extends Equatable{
  final TvListContainer tvContainer;
  final TvListContainer searchTvContainer;
  final String searchQuery;

  bool get isSearchMode => searchQuery.isNotEmpty;

  List<TV> get tvs => isSearchMode ? searchTvContainer.tvs : tvContainer.tvs;

  @override
  List<Object> get props => [tvContainer, searchTvContainer, searchQuery];

  const TvListState.initial()
      : tvContainer = const TvListContainer.initial(),
        searchTvContainer = const TvListContainer.initial(),
        searchQuery = '';

  const TvListState({
    required this.tvContainer,
    required this.searchTvContainer,
    required this.searchQuery,
  });

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
