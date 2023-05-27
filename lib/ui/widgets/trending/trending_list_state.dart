part of 'trending_list_bloc.dart';

class TrendingListState extends Equatable {
  final TrendingListContainer trendingListContainer;

  List<TrendingAll> get trending => trendingListContainer.trendingAll;

  const TrendingListState.initial() : trendingListContainer = const TrendingListContainer.initial();

  const TrendingListState({
    required this.trendingListContainer,
  });

  @override
  List<Object> get props => [trendingListContainer];

  TrendingListState copyWith({
    TrendingListContainer? trendingListContainer,
  }) {
    return TrendingListState(
      trendingListContainer: trendingListContainer ?? this.trendingListContainer,
    );
  }
}
