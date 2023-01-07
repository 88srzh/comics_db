// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/movie.dart';

class MovieListContainer extends Equatable {
  final List<Movie> movies;
  final int currentPage;
  final int totalPage;

  bool get isComplete => currentPage >= totalPage;

  const MovieListContainer.initial()
      : movies = const <Movie>[],
        currentPage = 0,
        totalPage = 1;

  const MovieListContainer(
      {required this.movies,
      required this.currentPage,
      required this.totalPage});

  @override
  List<Object> get props => [movies, currentPage, totalPage];

  MovieListContainer copyWith(
      {List<Movie>? movies, int? currentPage, int? totalPage}) {
    return MovieListContainer(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
    );
  }
}
