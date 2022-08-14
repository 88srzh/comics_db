part of 'movie_details_new_cubit.dart';

// @immutable
class MovieDetailsCubitNewState {
  final String overview;
  final String localeTag;
  final String posterPath;
  final String title;

  const MovieDetailsCubitNewState({
    required this.overview,
    required this.localeTag,
    required this.posterPath,
    required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MovieDetailsCubitNewState &&
              runtimeType == other.runtimeType &&
              overview == other.overview &&
              localeTag == other.localeTag &&
              posterPath == other.posterPath &&
              title == other.title;

  @override
  int get hashCode => overview.hashCode ^ localeTag.hashCode;

  MovieDetailsCubitNewState copyWith({
    String? overview,
    String? localeTag,
    String? posterPath,
    String? title,
  }) {
    return MovieDetailsCubitNewState(
      overview: overview ?? this.overview,
      localeTag: localeTag ?? this.localeTag,
      posterPath: posterPath ?? this.posterPath,
      title: title ?? this.title,
    );
  }
}