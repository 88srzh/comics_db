// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/tv_details.dart';
import 'package:comics_db_app/domain/entity/tv_details_credits.dart';
import 'package:comics_db_app/domain/entity/tv_details_videos.dart';
import 'package:comics_db_app/domain/services/tv_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_actor_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_people_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_trailer_data.dart';

part 'tv_details_state.dart';

class TvDetailsCubit extends Cubit<TvDetailsCubitState> {
  late DateFormat dateFormat;
  final data = TvDetailsData();
  final movieAndTvClient = MovieAndTvApiClient();
  final int tvId;
  final _tvService = TvService();

  TvDetailsCubit(this.tvId)
      : super(TvDetailsCubitState(
          posterPath: '',
          backdropPath: '',
          createBy: [],
          episodeRunTime: [],
          firstAirDate: '',
          genres: '',
          homepage: '',
          id: 0,
          inProduction: false,
          languages: [],
          lastAirDate: '',
          lastEpisodeToAir: LastEpisodeToAir(
            airDate: '',
            episodeNumber: 0,
            id: 0,
            name: '',
            overview: '',
            productionCode: '',
            seasonNumber: 0,
            stillPath: '',
            voteAverage: 0,
            voteCount: 0,
          ),
          name: '',
          networks: [],
          numberOfEpisodes: 0,
          numberOfSeasons: 0,
          originalCountry: [],
          originalLanguage: '',
          originalName: '',
          overview: '',
          popularity: 0,
          productionCompanies: [],
          productionCountries: [],
          seasons: [],
          spokenLanguages: [],
          status: '',
          tagline: '',
          type: '',
          voteAverage: 0,
          voteCount: 0,
          localeTag: '',
          credits: TvDetailsCredits(cast: [], crew: []),
          videos: TvDetailsVideos(results: []),
          isFavorite: false,
          actorsData: [],
          peopleData: [],
        )) {
    emit(TvDetailsCubitState(
      posterPath: state.posterPath,
      backdropPath: state.backdropPath,
      createBy: state.createBy,
      episodeRunTime: state.episodeRunTime,
      firstAirDate: state.firstAirDate,
      genres: state.genres,
      homepage: state.homepage,
      id: state.id,
      inProduction: state.inProduction,
      languages: state.languages,
      lastAirDate: state.lastAirDate,
      lastEpisodeToAir: state.lastEpisodeToAir,
      name: state.name,
      networks: state.networks,
      numberOfEpisodes: state.numberOfEpisodes,
      numberOfSeasons: state.numberOfSeasons,
      originalCountry: state.originalCountry,
      originalLanguage: state.originalLanguage,
      originalName: state.originalName,
      overview: state.overview,
      popularity: state.popularity,
      productionCompanies: state.productionCompanies,
      productionCountries: state.productionCountries,
      seasons: state.seasons,
      spokenLanguages: state.spokenLanguages,
      status: state.status,
      tagline: state.tagline,
      type: state.type,
      voteAverage: state.voteAverage,
      voteCount: state.voteCount,
      credits: state.credits,
      videos: state.videos,
      localeTag: state.localeTag,
      isFavorite: state.isFavorite,
      actorsData: state.actorsData,
      peopleData: state.peopleData,
    ));
  }

  String stringFromDate(DateTime? date) => date != null ? dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context, String localeTag) async {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    dateFormat = DateFormat.yMMMd(localeTag);
    updateData(null, false);
    await loadTvDetails(context);
  }

  Future<void> loadTvDetails(BuildContext context) async {
    try {
      final details = await _tvService.loadTvDetails(tvId: tvId, locale: state.localeTag);
      updateData(details.details, details.isFavorite);
    } on ApiClientException catch (e) {
      _handleApiClientException(e, context);
    }
  }

  void _handleApiClientException(ApiClientException exception, BuildContext context) {
    switch (exception.type) {
      case ApiClientExceptionType.sessionExpired:
        // _authService.logout();
        MainNavigation.resetNavigation(context);
        break;
      case ApiClientExceptionType.other:
        // print('exception other');
        break;
      default:
      // print(exception);
    }
  }

  Future<void> setupTvDetailsLocale(BuildContext context, String localeTag) async {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    dateFormat = DateFormat.yMMMd(localeTag);
    updateData(null, false);
    await loadTvDetails(context);
  }

  Future<void> updateData(TVDetails? details, bool isFavorite)  async {
    if (details == null) {
      return;
    }
    data.overview = details.overview;
    data.name = details.name;
    data.posterPath = details.posterPath ?? '';
    data.backdropPath = details.backdropPath ?? '';
    data.tagline = details.tagline;
    data.actorsData = details.credits.cast
        .map((e) => TvDetailsActorData(name: e.name, character: e.character, profilePath: e.profilePath))
        .toList();
    data.peopleData = makePeopleData(details);
    data.genres = makeGenres(details);

    // TODO need fix
    data.tvTrailedData.trailerKey = makeTrailerKey(details);

    data.tvDetailsScoresData = TvDetailsScoresData(
      voteCount: details.voteCount,
      popularity: details.voteAverage,
      voteAverage: details.voteAverage,
    );

    var actorsData = data.actorsData;
    var peopleData = data.peopleData;

    final newState = state.copyWith(
      posterPath: data.posterPath,
      backdropPath: data.backdropPath,
      overview: data.overview,
      name: data.name,
      tagline: data.tagline,
      voteCount: data.tvDetailsScoresData.voteCount,
      popularity: data.tvDetailsScoresData.popularity,
      voteAverage: data.tvDetailsScoresData.voteAverage,
      genres: data.genres,
      peopleData: peopleData,
      actorsData: actorsData,

      // videos: data.tvTrailedData.trailerKey,
    );
    emit(newState);
  }

  String makeTrailerKey(TVDetails details) {
    final videos = details.videos.results.where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
    if (trailerKey != null) {
      return trailerKey;
    } else {
      return 'No trailer key';
    }
  }

  String makeGenres(TVDetails details) {
    var texts = <String>[];
    if (details.genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genr in details.genres) {
        genresNames.add(genr.name);
      }
      texts.add(genresNames.join(', '));
    }
    return texts.join(' ');
  }

  List<List<TvDetailsPeopleData>> makePeopleData(TVDetails details) {
    var crew = details.credits.crew.map((e) => TvDetailsPeopleData(name: e.name, job: e.job)).toList();
    crew = crew.length > 4 ? crew.sublist(0, 4) : crew;
    var crewChunks = <List<TvDetailsPeopleData>>[];
    for (var i = 0; i < crew.length; i += 2) {
      crewChunks.add(crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2));
    }
    return crewChunks;
  }

  Future<void> toggleFavoriteTv(BuildContext context) async {
    data.favoriteData = data.favoriteData.copyWith(isFavorite: !data.favoriteData.isFavorite);
    try {
      await _tvService.updateFavoriteTvs(tvId: tvId, isFavorite: data.favoriteData.isFavorite);
      var newState = state.copyWith(isFavorite: data.favoriteData.isFavorite);
      emit(newState);
    } on ApiClientException catch (e) {
      _handleApiClientException(e, context);
    }
  }
}
