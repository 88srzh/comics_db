import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';

abstract class MovieListEvent {}

class MovieListEventLoadNextPage extends MovieListEvent {}

class MovieListEventLoadReset extends MovieListEvent {}

class MovieListEventSearchMovie extends MovieListEvent {
  final String query;

  MovieListEventSearchMovie(this.query);
}

class MovieListContainer {
  final List<Movie> movies;
  final int currentPage;
  final int totalPage;

  MovieListContainer({required this.movies, required this.currentPage, required this.totalPage});
}

class MovieListState {
  final MovieListContainer popularMovieContainer;
  final MovieListContainer searchMovieContainer;
  final String searchQuery;

  bool get isSearchMode => searchQuery.isNotEmpty;

  MovieListState({
    required this.popularMovieContainer,
    required this.searchMovieContainer,
    required this.searchQuery,
  });
}

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc(MovieListState initialState) : super(initialState);
}
