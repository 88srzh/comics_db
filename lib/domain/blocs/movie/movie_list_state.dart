part of 'movie_popular_list_bloc.dart';

class MovieListState extends Equatable {
  final MovieListContainer movieContainer;
  final MovieListContainer searchMovieContainer;
  final String searchQuery;

  bool get isSearchMode => searchQuery.isNotEmpty;

  List<Movie> get movies => isSearchMode ? searchMovieContainer.movies : movieContainer.movies;

  @override
  List<Object> get props => [movieContainer, searchMovieContainer, searchQuery];

  const MovieListState.initial()
      : movieContainer = const MovieListContainer.initial(),
        searchMovieContainer = const MovieListContainer.initial(),
        searchQuery = '';

  const MovieListState({
    required this.movieContainer,
    required this.searchMovieContainer,
    required this.searchQuery,
  });

  MovieListState copyWith({
    MovieListContainer? movieContainer,
    MovieListContainer? searchMovieContainer,
    String? searchQuery,
  }) {
    return MovieListState(
      movieContainer: movieContainer ?? this.movieContainer,
      searchMovieContainer: searchMovieContainer ?? this.searchMovieContainer,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
