part of 'movie_details_cubit.dart';

@immutable
class MovieDetailsCubitState {
  final String overview;
  final String localeTag;
  final String posterPath;
  final String title;
  final String? tagline;
  final double? voteAverage;

  const MovieDetailsCubitState({
    required this.overview,
    required this.localeTag,
    required this.posterPath,
    required this.title,
    required this.tagline,
    required this.voteAverage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCubitState &&
          runtimeType == other.runtimeType &&
          overview == other.overview &&
          localeTag == other.localeTag &&
          posterPath == other.posterPath &&
          title == other.title &&
          tagline == other.tagline &&
          voteAverage == other.voteAverage;

  @override
  int get hashCode => overview.hashCode ^ localeTag.hashCode;

  MovieDetailsCubitState copyWith({
    String? overview,
    String? localeTag,
    String? posterPath,
    String? title,
    String? tagline,
    double? voteAverage,
  }) {
    return MovieDetailsCubitState(
      overview: overview ?? this.overview,
      localeTag: localeTag ?? this.localeTag,
      posterPath: posterPath ?? this.posterPath,
      title: title ?? this.title,
      tagline: tagline ?? this.tagline,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }
}
