part of 'watchlist_bloc.dart';

class WatchlistState extends Equatable {
  final MovieListContainer movieListContainer;
  final TvListContainer tvListContainer;

  List<Movie> get movies => movieListContainer.movies;

  List<TV> get tvs => tvListContainer.tvs;

  const WatchlistState.initial()
      : movieListContainer = const MovieListContainer.initial(),
        tvListContainer = const TvListContainer.initial();

  const WatchlistState({
    required this.movieListContainer,
    required this.tvListContainer,
  });

  @override
  List<Object> get props => [movieListContainer, tvListContainer];

  WatchlistState copyWith({
    MovieListContainer? movieListContainer,
    TvListContainer? tvListContainer,
  }) {
    return WatchlistState(
      movieListContainer: movieListContainer ?? this.movieListContainer,
      tvListContainer: tvListContainer ?? this.tvListContainer,
    );
  }
}
