part of 'movie_details_cubit.dart';

@immutable
class MovieDetailsCubitState {
  final String overview;
  final String localeTag;
  final String title;
  final String? tagline;
  final double? voteAverage;
  final int voteCount;
  final double? popularity;
  final String releaseDate;
  final String summary;
  final String genres;

  // final String? posterPath;
  // final String? backdropPath;
  const MovieDetailsCubitState({
    required this.overview,
    required this.localeTag,
    required this.title,
    required this.tagline,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.releaseDate,
    required this.summary,
    required this.genres,

    // required this.posterPath,
    // required this.backdropPath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCubitState &&
          runtimeType == other.runtimeType &&
          overview == other.overview &&
          localeTag == other.localeTag &&
          title == other.title &&
          tagline == other.tagline &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount &&
          popularity == other.popularity &&
          releaseDate == other.releaseDate &&
          summary == other.summary &&
          genres == other.genres;

  // posterPath == other.posterPath &&
  // backdropPath == other.backdropPath;

  @override
  int get hashCode => overview.hashCode ^ localeTag.hashCode;

  MovieDetailsCubitState copyWith({
    String? overview,
    String? localeTag,
    String? title,
    String? tagline,
    double? voteAverage,
    int? voteCount,
    double? popularity,
    String? releaseDate,
    String? summary,
    String? genres,

    // String? posterPath,
    // String? backdropPath,
  }) {
    return MovieDetailsCubitState(
      overview: overview ?? this.overview,
      localeTag: localeTag ?? this.localeTag,
      title: title ?? this.title,
      tagline: tagline ?? this.tagline,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
      summary: summary ?? this.summary,
      genres: genres ?? this.genres,

      // posterPath: posterPath ?? this.posterPath,
      // backdropPath: backdropPath ?? this.backdropPath,
    );
  }
}
