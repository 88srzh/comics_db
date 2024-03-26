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
  final String runtime;
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
  final MovieDetailsExternalIdsData externalIds;
  final String? facebookId;
  final String? imdbId;
  final String? wikidataId;
  final String? instagramId;
  final String? twitterId;
  final String? homepage;
  final List<MovieDetailsReviewsData> reviews;
  final String originalLanguage;
  final int budget;
  final int revenue;
  final String status;
  // final List<MovieDetailsKeywordsData> keywords;
  final String keywords;
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
    required this.runtime,
    required this.genres,
    required this.peopleData,
    required this.actorsData,
    required this.isLoading,
    required this.isFavorite,
    required this.isWatchlist,
    required this.recommendations,
    required this.videos,
    required this.allVideos,
    required this.externalIds,
    required this.facebookId,
    required this.imdbId,
    required this.wikidataId,
    required this.instagramId,
    required this.twitterId,
    required this.homepage,
    required this.reviews,
    required this.originalLanguage,
    required this.budget,
    required this.revenue,
    required this.status,
    required this.keywords,
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
          runtime == other.runtime &&
          genres == other.genres &&
          peopleData == other.peopleData &&
          actorsData == other.actorsData &&
          isLoading == other.isLoading &&
          isFavorite == other.isFavorite &&
          isWatchlist == other.isWatchlist &&
          recommendations == other.recommendations &&
          externalIds == other.externalIds &&
          facebookId == other.facebookId &&
          imdbId == other.imdbId &&
          wikidataId == other.wikidataId &&
          instagramId == other.instagramId &&
          twitterId == other.twitterId &&
          homepage == other.homepage &&
          reviews == other.reviews &&
          // similar == other.similar;
          videos == other.videos &&
          allVideos == other.allVideos &&
          originalLanguage == other.originalLanguage &&
          budget == other.budget &&
          revenue == other.revenue &&
          status == other.status &&
          keywords == other.keywords;
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
      runtime.hashCode ^
      genres.hashCode ^
      peopleData.hashCode ^
      actorsData.hashCode ^
      isLoading.hashCode ^
      isFavorite.hashCode ^
      isWatchlist.hashCode ^
      recommendations.hashCode ^
      externalIds.hashCode ^
      homepage.hashCode ^
      reviews.hashCode ^
      // similar.hashCode;
      facebookId.hashCode ^
      imdbId.hashCode ^
      wikidataId.hashCode ^
      instagramId.hashCode ^
      twitterId.hashCode ^
      videos.hashCode ^
      allVideos.hashCode ^
      originalLanguage.hashCode ^
      budget.hashCode ^
      revenue.hashCode ^
      status.hashCode ^
      keywords.hashCode;
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
    String? runtime,
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
    String? facebookId,
    String? imdbId,
    String? wikidataId,
    String? instagramId,
    String? twitterId,
    String? homepage,
    List<MovieDetailsReviewsData>? reviews,
    String? originalLanguage,
    int? budget,
    int? revenue,
    String? status,
    // List<MovieDetailsKeywordsData>? keywords,
    String? keywords,

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
      runtime: runtime ?? this.runtime,
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
      externalIds: externalIds ?? this.externalIds,
      facebookId: facebookId ?? this.facebookId,
      imdbId: imdbId ?? this.imdbId,
      wikidataId: wikidataId ?? this.wikidataId,
      instagramId: instagramId ?? this.instagramId,
      twitterId: twitterId ?? this.twitterId,
      homepage: homepage ?? this.homepage,
      reviews: reviews ?? this.reviews,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      budget: budget ?? this.budget,
      revenue: revenue ?? this.revenue,
      status: status ?? this.status,
      keywords: keywords ?? this.keywords,
      // similar: similar ?? this.similar,
      // collection: collection ?? this.collection,
    );
  }
}
