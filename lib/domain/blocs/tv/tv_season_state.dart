part of 'tv_season_list_bloc.dart';

class TvSeasonState extends Equatable {
  final TvSeasonContainer tvSeasonContainer;
  final String searchQuery;

  bool get isSearchMode => searchQuery.isNotEmpty;

  @override
  List<Object> get props => [tvSeasonContainer, searchQuery];

  const TvSeasonState.initial() : tvSeasonContainer = const TvSeasonContainer.initial(), searchQuery = '';

  const TvSeasonState({
    required this.tvSeasonContainer,
    required this.searchQuery,
  });

  TvSeasonState copyWith({
    TvSeasonContainer? tvSeasonContainer,
    String? searchQuery,
  }) {
    return TvSeasonState(
      tvSeasonContainer: tvSeasonContainer ?? this.tvSeasonContainer,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

}