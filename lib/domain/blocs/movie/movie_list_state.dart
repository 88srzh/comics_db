part of 'movie_popular_list_bloc.dart';

class MovieListState extends Equatable {
  final MovieListContainer movieContainer;
  final MovieListContainer searchMovieContainer;
  final String searchQuery;
  final List<Movie> movies;

  bool get isSearchMode => searchQuery.isNotEmpty;

  // List<Movie> get movies =>
  //     isSearchMode ? searchMovieContainer.movies : movieContainer.movies;

  @override
  List<Object> get props => [movieContainer, searchMovieContainer, searchQuery];

  const MovieListState.initial()
      : movieContainer = const MovieListContainer.initial(),
        searchMovieContainer = const MovieListContainer.initial(),
        searchQuery = '',
        movies = const <Movie>[];

  const MovieListState({
    required this.movieContainer,
    required this.searchMovieContainer,
    required this.searchQuery,
    required this.movies,
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
      movies: movies ?? this.movies,
    );
  }
}
