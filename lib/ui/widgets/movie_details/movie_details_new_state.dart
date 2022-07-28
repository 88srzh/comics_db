part of 'movie_details_new_cubit.dart';

// @immutable
class MovieDetailsCubitNewState {
  final List<MovieListData> movies;
  final String localeTag;

  const MovieDetailsCubitNewState({
    required this.movies,
    required this.localeTag,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCubitNewState &&
          runtimeType == other.runtimeType &&
          movies == other.movies &&
          localeTag == other.localeTag;

  @override
  int get hashCode => movies.hashCode ^ localeTag.hashCode;

  MovieDetailsCubitNewState copyWith({
    List<MovieListData>? movies,
    String? localeTag,
  }) {
    return MovieDetailsCubitNewState(
      movies: movies ?? this.movies,
      localeTag: localeTag ?? this.localeTag,
    );
  }
}

// class MovieDetailsNewInitial extends MovieDetailsNewState {}
