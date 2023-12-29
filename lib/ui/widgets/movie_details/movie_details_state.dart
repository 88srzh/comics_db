part of 'movie_details_cubit.dart';

// @immutable
class MovieDetailsCubitState {
  final int id;
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
  final List<List<MovieDetailsMoviePeopleData>> peopleData;
  final List<MovieDetailsMovieActorData> actorsData;
  final bool isLoading;
  final bool isFavorite;
  final bool isWatchlist;
  final List<MovieDetailsRecommendationsData> recommendations;
  final List<MovieDetailsVideosData> videos;
  final List<MovieDetailsAllVideosData> allVideos;
  // final String? facebook;
  // final MovieDetailsExternalIdsData externalIds;
  // final List<MovieDetailsReviewsData> reviews;
  // final List<MovieDetailsSimilarData> similar;
  // final List<BelongsToCollectionData>? collection;

  const MovieDetailsCubitState({
    required this.id,
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
    required this.peopleData,
    required this.actorsData,
    required this.isLoading,
    required this.isFavorite,
    required this.isWatchlist,
    required this.recommendations,
    required this.videos,
    required this.allVideos,
    // required this.facebook,
    // required this.externalIds,
    // required this.reviews,
    // required this.similar,
    // required this.collection,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCubitState &&
          id == other.id &&
          runtimeType == other.runtimeType &&
          posterPath == other.posterPath &&
          backdropPath == other.backdropPath &&
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
          peopleData == other.peopleData &&
          actorsData == other.actorsData &&
          isLoading == other.isLoading &&
          isFavorite == other.isFavorite &&
          isWatchlist == other.isWatchlist &&
          recommendations == other.recommendations &&
          // externalIds == other.externalIds &&
          // reviews == other.reviews &&
          // similar == other.similar;
          videos == other.videos &&
          allVideos == other.allVideos;
          // facebook == other.facebook;
          // collection == other.collection;

  @override
  int get hashCode =>
      id.hashCode ^
      posterPath.hashCode ^
      backdropPath.hashCode ^
      overview.hashCode ^
      localeTag.hashCode ^
      title.hashCode ^
      tagline.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode ^
      popularity.hashCode ^
      releaseDate.hashCode ^
      summary.hashCode ^
      genres.hashCode ^
      peopleData.hashCode ^
      actorsData.hashCode ^
      isLoading.hashCode ^
      isFavorite.hashCode ^
      isWatchlist.hashCode ^
      recommendations.hashCode ^
      // externalIds.hashCode ^
      // reviews.hashCode ^
      // similar.hashCode;
      videos.hashCode ^
      allVideos.hashCode;
      // facebook.hashCode;
      // collection.hashCode;

  MovieDetailsCubitState copyWith({
    int? id,
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
    List<List<MovieDetailsMoviePeopleData>>? peopleData,
    List<MovieDetailsMovieActorData>? actorsData,
    bool? isLoading,
    bool? isFavorite,
    bool? isWatchlist,
    List<MovieDetailsRecommendationsData>? recommendations,
    List<MovieDetailsVideosData>? videos,
    List<MovieDetailsAllVideosData>? allVideos,
    // String? facebook,
    MovieDetailsExternalIdsData? externalIds,
    // List<MovieDetailsReviewsData>? reviews,
    // List<MovieDetailsSimilarData>? similar,
    // List<BelongsToCollectionData>? collection,
  }) {
    return MovieDetailsCubitState(
      id: id ?? this.id,
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
      peopleData: peopleData ?? this.peopleData,
      actorsData: actorsData ?? this.actorsData,
      isLoading: isLoading ?? this.isLoading,
      isFavorite: isFavorite ?? this.isFavorite,
      isWatchlist: isWatchlist ?? this.isWatchlist,
      recommendations: recommendations ?? this.recommendations,
      videos: videos ?? this.videos,
      allVideos: allVideos ?? this.allVideos,
      // facebook: facebook ?? this.facebook,
      // externalIds: externalIds ?? this.externalIds,
      // reviews: reviews ?? this.reviews,
      // similar: similar ?? this.similar,
      // collection: collection ?? this.collection,
    );
  }
}
