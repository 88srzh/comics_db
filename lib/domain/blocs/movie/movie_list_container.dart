// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/movie.dart';

class MovieListContainer extends Equatable {
  final List<Movie> movies;
  final int currentPage;
  final int totalPage;
  final int totalResults;

  bool get isComplete => currentPage >= totalPage;

  const MovieListContainer.initial()
      : movies = const <Movie>[],
        currentPage = 0,
        totalPage = 1,
        totalResults = 0;

  const MovieListContainer(
      {required this.movies, required this.currentPage, required this.totalPage, required this.totalResults});

  @override
  List<Object> get props => [movies, currentPage, totalPage, totalResults];

  MovieListContainer copyWith({List<Movie>? movies, int? currentPage, int? totalPage, int? totalResults}) {
    return MovieListContainer(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
