import 'package:comics_db_app/domain/blocs/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';

class MovieListState {
  final MovieListContainer movieContainer;
  final MovieListContainer searchMovieContainer;
  final String searchQuery;

  bool get isSearchMode => searchQuery.isNotEmpty;

  List<Movie> get movies => isSearchMode ? searchMovieContainer.movies : movieContainer.movies;

  MovieListState.initial()
      : movieContainer = const MovieListContainer.initial(),
        searchMovieContainer = const MovieListContainer.initial(),
        searchQuery = '';

  MovieListState({
    required this.movieContainer,
    required this.searchMovieContainer,
    required this.searchQuery,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MovieListState &&
              runtimeType == other.runtimeType &&
              movieContainer == other.movieContainer &&
              searchMovieContainer == other.searchMovieContainer &&
              searchQuery == other.searchQuery;

  @override
  int get hashCode => movieContainer.hashCode ^ searchMovieContainer.hashCode ^ searchQuery.hashCode;

  MovieListState copyWith({
    MovieListContainer? movieContainer,
    MovieListContainer? searchMovieContainer,
    String? searchQuery,
  }) {
    return MovieListState(
        movieContainer: movieContainer ?? this.movieContainer,
        searchMovieContainer: searchMovieContainer ?? this.searchMovieContainer,
        searchQuery: searchQuery ?? this.searchQuery);
  }
}