part of 'watchlist_bloc.dart';

class WatchlistState extends Equatable {
  final MovieListContainer watchlistContainer;

  List<TrendingAll> get watchlist => watchlistContainer.watchlist;

  const WatchlistState.initial() : watchlistContainer = const MovieListContainer.initial();

  const WatchlistState({
    required this.watchlistContainer,
  });

  @override
  List<Object> get props => [watchlistContainer];

  WatchlistState copyWith({
    MovieListContainer? watchlistContainer,
  }) {
    return WatchlistState(
      watchlistContainer: watchlistContainer ?? this.watchlistContainer,
    );
  }
}
