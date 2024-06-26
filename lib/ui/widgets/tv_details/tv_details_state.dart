part of 'tv_details_cubit.dart';

class TvDetailsCubitState {
  final String? posterPath;
  final String? backdropPath;
  final List<List<TvDetailsCreatedByData>> createdBy;
  final List<int> episodeRunTime;
  final String? firstAirDate;
  final String? lastAirDate;
  final String genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String? airDateOfSeason;
  final LastEpisodeToAir lastEpisodeToAir;
  final String name;
  final NextEpisodeToAir? nextEpisodeToAir;
  final List<TvDetailsNetworkData> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originalCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<TvsSeasonData> seasons;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String? tagline;
  final String type;
  final double voteAverage;
  final int voteCount;
  final TvDetailsCredits credits;
  final TvDetailsVideos videos;
  final String localeTag;
  final bool isFavorite;
  final bool isWatchlist;
  final List<TvDetailsActorData> actorsData;
  final List<List<TvDetailsPeopleData>> peopleData;
  final List<TvDetailsRecommendationsData> recommendationsData;
  final List<TvDetailsVideosData> videosData;
  final String? rating;
  final String? keywords;
  final String lastEpisodeToAirName;
  final String lastEpisodeToAirType;

  const TvDetailsCubitState({
    required this.posterPath,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.lastAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.airDateOfSeason,
    required this.lastEpisodeToAir,
    required this.name,
    this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
    required this.credits,
    required this.videos,
    required this.localeTag,
    required this.isFavorite,
    required this.isWatchlist,
    required this.actorsData,
    required this.peopleData,
    required this.recommendationsData,
    required this.videosData,
    required this.rating,
    required this.keywords,
    required this.lastEpisodeToAirName,
    required this.lastEpisodeToAirType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvDetailsCubitState &&
          runtimeType == other.runtimeType &&
          posterPath == other.posterPath &&
          backdropPath == other.backdropPath &&
          createdBy == other.createdBy &&
          episodeRunTime == other.episodeRunTime &&
          firstAirDate == other.firstAirDate &&
          lastAirDate == other.lastAirDate &&
          genres == other.genres &&
          homepage == other.homepage &&
          id == other.id &&
          inProduction == other.inProduction &&
          languages == other.languages &&
          airDateOfSeason == other.airDateOfSeason &&
          lastEpisodeToAir == other.lastEpisodeToAir &&
          name == other.name &&
          nextEpisodeToAir == other.nextEpisodeToAir &&
          networks == other.networks &&
          numberOfEpisodes == other.numberOfEpisodes &&
          numberOfSeasons == other.numberOfSeasons &&
          originalCountry == other.originalCountry &&
          originalLanguage == other.originalLanguage &&
          originalName == other.originalName &&
          overview == other.overview &&
          popularity == other.popularity &&
          productionCompanies == other.productionCompanies &&
          productionCountries == other.productionCountries &&
          seasons == other.seasons &&
          spokenLanguages == other.spokenLanguages &&
          status == other.status &&
          tagline == other.tagline &&
          type == other.type &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount &&
          credits == other.credits &&
          videos == other.videos &&
          localeTag == other.localeTag &&
          isFavorite == other.isFavorite &&
          isWatchlist == other.isWatchlist &&
          actorsData == other.actorsData &&
          peopleData == other.peopleData &&
          recommendationsData == other.recommendationsData &&
          videosData == other.videosData &&
          rating == other.rating &&
          keywords == other.keywords &&
          lastEpisodeToAirName == other.lastEpisodeToAirName &&
          lastEpisodeToAirType == other.lastEpisodeToAirType;

  // ratingsData == other.ratingsData;

  @override
  int get hashCode =>
      posterPath.hashCode ^
      backdropPath.hashCode ^
      createdBy.hashCode ^
      episodeRunTime.hashCode ^
      firstAirDate.hashCode ^
      lastAirDate.hashCode ^
      genres.hashCode ^
      homepage.hashCode ^
      id.hashCode ^
      inProduction.hashCode ^
      languages.hashCode ^
      airDateOfSeason.hashCode ^
      lastEpisodeToAir.hashCode ^
      name.hashCode ^
      nextEpisodeToAir.hashCode ^
      networks.hashCode ^
      numberOfEpisodes.hashCode ^
      numberOfSeasons.hashCode ^
      originalCountry.hashCode ^
      originalLanguage.hashCode ^
      originalName.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      productionCompanies.hashCode ^
      productionCountries.hashCode ^
      seasons.hashCode ^
      spokenLanguages.hashCode ^
      status.hashCode ^
      tagline.hashCode ^
      type.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode ^
      credits.hashCode ^
      videos.hashCode ^
      localeTag.hashCode ^
      isFavorite.hashCode ^
      isWatchlist.hashCode ^
      actorsData.hashCode ^
      peopleData.hashCode ^
      recommendationsData.hashCode ^
      videosData.hashCode ^
      rating.hashCode ^
      keywords.hashCode ^
      lastEpisodeToAirName.hashCode ^
      lastEpisodeToAirType.hashCode;

  // ratingsData.hashCode;

  TvDetailsCubitState copyWith({
    String? posterPath,
    String? backdropPath,
    List<List<TvDetailsCreatedByData>>? createdBy,
    List<int>? episodeRunTime,
    String? firstAirDate,
    String? lastAirDate,
    String? genres,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    String? airDateOfSeason,
    LastEpisodeToAir? lastEpisodeToAir,
    String? name,
    NextEpisodeToAir? nextEpisodeToAir,
    List<TvDetailsNetworkData>? networks,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originalCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    List<TvsSeasonData>? seasons,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
    TvDetailsCredits? credits,
    TvDetailsVideos? videos,
    String? localeTag,
    bool? isFavorite,
    bool? isWatchlist,
    List<TvDetailsActorData>? actorsData,
    List<List<TvDetailsPeopleData>>? peopleData,
    List<TvDetailsRecommendationsData>? recommendationsData,
    List<TvDetailsVideosData>? videosData,
    // List<TvDetailsContentRatingsData>? ratingsData,
    String? rating,
    String? keywords,
    String? lastEpisodeToAirName,
    String? lastEpisodeToAirType,
  }) {
    return TvDetailsCubitState(
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      createdBy: createdBy ?? this.createdBy,
      episodeRunTime: episodeRunTime ?? this.episodeRunTime,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      lastAirDate: lastAirDate ?? this.lastAirDate,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      inProduction: inProduction ?? this.inProduction,
      languages: languages ?? this.languages,
      airDateOfSeason: airDateOfSeason ?? this.airDateOfSeason,
      lastEpisodeToAir: lastEpisodeToAir ?? this.lastEpisodeToAir,
      name: name ?? this.name,
      nextEpisodeToAir: nextEpisodeToAir ?? this.nextEpisodeToAir,
      networks: networks ?? this.networks,
      numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
      numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
      originalCountry: originalCountry ?? this.originalCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      seasons: seasons ?? this.seasons,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      type: type ?? this.type,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      credits: credits ?? this.credits,
      videos: videos ?? this.videos,
      localeTag: localeTag ?? this.localeTag,
      isFavorite: isFavorite ?? this.isFavorite,
      isWatchlist: isWatchlist ?? this.isWatchlist,
      actorsData: actorsData ?? this.actorsData,
      peopleData: peopleData ?? this.peopleData,
      recommendationsData: recommendationsData ?? this.recommendationsData,
      videosData: videosData ?? this.videosData,
      // ratingsData: ratingsData ?? this.ratingsData,
      rating: rating ?? this.rating,
      keywords: keywords ?? this.keywords,
      lastEpisodeToAirName: lastEpisodeToAirName ?? this.lastEpisodeToAirName,
      lastEpisodeToAirType: lastEpisodeToAirType ?? this.lastEpisodeToAirType,
    );
  }
}
