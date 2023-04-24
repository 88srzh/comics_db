// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/tv_details.dart';
import 'package:comics_db_app/domain/entity/tv_details_credits.dart';
import 'package:comics_db_app/domain/entity/tv_details_videos.dart';
import 'package:comics_db_app/domain/services/tv_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';

part 'tv_details_state.dart';

class TvDetailsCubit extends Cubit<TvDetailsCubitState> {
  late DateFormat dateFormat;
  final data = TvDetailsData();
  final movieAndTvClient = MovieAndTvApiClient();
  final int tvId;
  final _tvService = TvService();

  TvDetailsCubit(this.tvId)
      : super(TvDetailsCubitState(
          createBy: [],
          episodeRunTime: [],
          firstAirDate: '',
          genres: [],
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
        )) {
    emit(TvDetailsCubitState(
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
    ));
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

  void updateData(TVDetails? details, bool isFavorite) {
    if (details == null) {
      return;
    }
    data.overview = details.overview;
    data.name = details.name;
    data.tvDetailsPosterData = TvDetailsPosterData(
      backdropPath: details.backdropPath,
      posterPath: details.posterPath,
    );
    data.tvNameData = TvDetailsNameData(name: details.name, tagline: details.tagline);
    final videos = details.videos.results.where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
    data.tvTrailedData = TvDetailsTrailerData(trailerKey: trailerKey);
    data.tvDetailsScoresData = TvDetailsScoresData(
      voteCount: details.voteCount,
      popularity: details.voteAverage,
      voteAverage: details.voteAverage.toString(),
    );
    // data.genres = makeGenres(details);

    final newState = state.copyWith(
      overview: data.overview,
      name: data.name,
      tagline: data.tvNameData.tagline,
      // videos: data.tvTrailedData.trailerKey,

    );
    emit(newState);
  }
}
