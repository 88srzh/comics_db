part of 'tv_season_list_bloc.dart';

class TvSeasonState extends Equatable {
  final TvSeasonContainer tvSeasonContainer;
  final TvSeasonContainer searchTvContainer;
  final String searchQuery;

  bool get isSearchMode => searchQuery.isNotEmpty;

  List<TvSeasonDetails> get tvSeasons => isSearchMode ? searchTvContainer.tvSeason : tvSeasonContainer.tvSeason;

  @override
  List<Object> get props => [tvSeasonContainer, searchQuery];

  const TvSeasonState.initial()
      : tvSeasonContainer = const TvSeasonContainer.initial(),
        searchTvContainer = const TvSeasonContainer.initial(),
        searchQuery = '';

  const TvSeasonState({
    required this.tvSeasonContainer,
    required this.searchTvContainer,
    required this.searchQuery,
  });

  TvSeasonState copyWith({
    TvSeasonContainer? tvSeasonContainer,
    TvSeasonContainer? searchTvContainer,
    String? searchQuery,
  }) {
    return TvSeasonState(
      tvSeasonContainer: tvSeasonContainer ?? this.tvSeasonContainer,
      searchTvContainer: searchTvContainer ?? this.searchTvContainer,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
