part of 'movie_details_new_cubit.dart';

// @immutable
class MovieDetailsCubitNewState {
  final String overview;
  final String localeTag;
  final String posterPath;

  const MovieDetailsCubitNewState({
    required this.overview,
    required this.localeTag,
    required this.posterPath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCubitNewState &&
          runtimeType == other.runtimeType &&
          overview == other.overview &&
          posterPath == other.posterPath &&
          localeTag == other.localeTag;

  @override
  int get hashCode => overview.hashCode ^ localeTag.hashCode;

  MovieDetailsCubitNewState copyWith({
    String? overview,
    String? localeTag,
    String? posterPath,
  }) {
    return MovieDetailsCubitNewState(
      overview: overview ?? this.overview,
      localeTag: localeTag ?? this.localeTag,
      posterPath: posterPath ?? this.posterPath,
    );
  }
}