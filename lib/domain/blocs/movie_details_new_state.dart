part of 'movie_details_new_bloc.dart';

// @immutable
class MovieDetailsNewState {
  final MovieDetailsContainer movieDetailsContainer;

  String get detailsOverview => movieDetailsContainer.overview;

  MovieDetailsNewState.initial() : movieDetailsContainer = const MovieDetailsContainer.initial();

  const MovieDetailsNewState({
    required this.movieDetailsContainer,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsNewState &&
          runtimeType == other.runtimeType &&
          movieDetailsContainer == other.movieDetailsContainer;

  @override
  int get hashCode => movieDetailsContainer.hashCode;

  MovieDetailsNewState copyWith({
    MovieDetailsContainer? movieDetailsContainer,
  }) {
    return MovieDetailsNewState(
      movieDetailsContainer: movieDetailsContainer ?? this.movieDetailsContainer,
    );
  }
}
