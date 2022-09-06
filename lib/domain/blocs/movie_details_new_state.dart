/*
part of 'movie_details_bloc.dart';

// @immutable
class MovieDetailsNewState {
  final MovieDetailsContainer movieDetailsContainer;

  String get detailsOverview => movieDetailsContainer.overview;

  MovieDetailsNewState.initial() : movieDetailsContainer = const MovieDetailsContainer.initial();

  const MovieDetailsNewState({
    required this.movieDetailsContainer,
  });

  MovieDetailsNewState copyWith({
    MovieDetailsContainer? movieDetailsContainer,
    int? movieId,
  }) {
    return MovieDetailsNewState(
      movieDetailsContainer: movieDetailsContainer ?? this.movieDetailsContainer,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsNewState &&
          runtimeType == other.runtimeType &&
          movieDetailsContainer == other.movieDetailsContainer;

  @override
  int get hashCode => movieDetailsContainer.hashCode;
}
*/
