part of 'movie_details_cubit.dart';

// @immutable
class MovieDetailsCubitState {
  final String? posterPath;
  final String? backdropPath;
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
  final String? trailerKey;
  final List<List<MovieDetailsMoviePeopleData>> peopleData;
  final List<MovieDetailsMovieActorData> actorsData;
  final bool isLoading;
  final bool isFavorite;

  const MovieDetailsCubitState({
    required this.posterPath,
    required this.backdropPath,
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
    required this.trailerKey,
    required this.peopleData,
    required this.actorsData,
    required this.isLoading,
    required this.isFavorite,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCubitState &&
          posterPath == other.posterPath &&
          backdropPath == other.backdropPath &&
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
          genres == other.genres &&
          trailerKey == other.trailerKey &&
          peopleData == other.peopleData &&
          actorsData == other.actorsData &&
          isLoading == other.isLoading &&
          isFavorite == other.isFavorite;

  // TODO fix hashCode
  @override
  int get hashCode => overview.hashCode ^ localeTag.hashCode;

  MovieDetailsCubitState copyWith({
    String? posterPath,
    String? backdropPath,
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
    String? trailerKey,
    List<List<MovieDetailsMoviePeopleData>>? peopleData,
    List<MovieDetailsMovieActorData>? actorsData,
    bool? isLoading,
    bool? isFavorite,
  }) {
    return MovieDetailsCubitState(
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
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
      trailerKey: trailerKey ?? this.trailerKey,
      peopleData: peopleData ?? this.peopleData,
      actorsData: actorsData ?? this.actorsData,
      isLoading: isLoading ?? this.isLoading,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
