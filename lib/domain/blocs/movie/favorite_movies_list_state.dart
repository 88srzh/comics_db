part of 'favorite_movies_list_bloc.dart';

class FavoriteMovieListState extends Equatable {
  final List<Movie> movies;
  final int totalResults;


  // List<Movie> get movies => isSearchMode ? searchMovieContainer.movies : movieContainer.movies;

  @override
  List<Object> get props => [movies, totalResults];

  FavoriteMovieListState.initial()
      : movies = [],
        totalResults = 0;

  const FavoriteMovieListState({
    required this.movies,
    required this.totalResults,
  });

  FavoriteMovieListState copyWith({
    List<Movie>? movies,
    int? totalResults,
  }) {
    return FavoriteMovieListState(
      movies: movies ?? this.movies,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}