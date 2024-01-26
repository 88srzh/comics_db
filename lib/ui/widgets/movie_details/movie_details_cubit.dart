// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:comics_db_app/ui/widgets/movie_details/components/external_ids_data.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/actor_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_all_videos_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_videos_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_people_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/recommendations_data.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsCubitState> {
  late DateFormat _dateFormat;
  final data = MovieDetailsData();

  // MovieDetailsTrailerData trailerData = MovieDetailsTrailerData();
  // String _locale = '';
  final movieAndTvApiClient = MovieAndTvApiClient();
  final int movieId;
  final _movieService = MovieService();

  // final _localeStorage = LocalizedModelStorage();

  // TODO may be delete isLoading, because it's unnecessary
  bool isLoading = true;

  MovieDetailsCubit(this.movieId)
      // TODO should fix
      : super(const MovieDetailsCubitState(
          id: 0,
          posterPath: '',
          backdropPath: '',
          overview: '',
          localeTag: '',
          title: '',
          tagline: '',
          voteAverage: 0,
          voteCount: 0,
          popularity: 0,
          releaseDate: '',
          runtime: '',
          genres: '',
          peopleData: [],
          actorsData: [],
          isLoading: false,
          isFavorite: false,
          isWatchlist: false,
          recommendations: [],
          videos: [],
          allVideos: [],
          // facebook: '',
          // externalIds: [],
          // reviews: [],
          // similar: [],
          // collection: [],
        )) {
    emit(MovieDetailsCubitState(
      id: state.id,
      posterPath: state.posterPath,
      backdropPath: state.backdropPath,
      overview: state.overview,
      localeTag: state.localeTag,
      title: state.title,
      tagline: state.tagline,
      voteAverage: state.voteAverage,
      voteCount: state.voteCount,
      popularity: state.popularity,
      releaseDate: state.releaseDate,
      runtime: state.runtime,
      genres: state.genres,
      peopleData: state.peopleData,
      actorsData: state.actorsData,
      isLoading: state.isLoading,
      isFavorite: state.isFavorite,
      isWatchlist: state.isWatchlist,
      recommendations: state.recommendations,
      videos: state.videos,
      allVideos: state.allVideos,
      // externalIds: state.externalIds,
      // facebook: state.facebook,
      // reviews: state.reviews,
      // similar: state.similar,
      // collection: state.collection,
    ));
  }

  Future<void> loadMovieDetails(BuildContext context) async {
    try {
      final details = await _movieService.loadMovieDetails(movieId: movieId, locale: state.localeTag);
      updateData(details.details, details.isFavorite, details.isWatchlist);
    } on ApiClientException catch (e) {
      _handleApiClientException(e);
    }
  }

  void _handleApiClientException(ApiClientException exception) {
    switch (exception.type) {
      case ApiClientExceptionType.sessionExpired:
        // _authService.logout();
        // MainNavigation.resetNavigation();
        break;
      case ApiClientExceptionType.other:
        // print('exception other');
        break;
      default:
      // print(exception);
    }
  }

  Future<void> setupMovieDetailsLocale(BuildContext context, String localeTag) async {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    // final locale = Localizations.localeOf(context).toLanguageTag();
    // if (_locale == locale) return;
    // _locale = locale;
    _dateFormat = DateFormat.yMMMd(localeTag);
    // if (!_localeStorage.updateLocale(locale)) return;
    updateData(null, false, false);
    await loadMovieDetails(context);
  }

  void updateData(MovieDetails? details, bool isFavorite, bool isWatchlist) {
    // may be i need await somewhere here
    data.isLoading = details == null;
    if (details == null) {
      return;
    }
    data.id = details.id;
    data.overview = details.overview ?? 'Loading description...';
    data.title = details.title;
    data.tagline = details.tagline ?? 'Loading tagline..';
    data.voteAverage = details.voteAverage;
    data.voteCount = details.voteCount;
    data.popularity = details.popularity;
    data.releaseDate = makeReleaseDate(details);
    data.summary = makeSummary(details);
    data.genres = makeGenres(details);
    data.peopleData = makePeopleData(details);
    data.posterPath = details.posterPath;
    data.backdropPath = details.backdropPath;
    data.videosData = makeTrailerKey(details);
    // data.facebook = details.externalIds.facebookId;

    // if (details.belongsToCollection != null) {
    //   data.collectionData = details.belongsToCollection!.map((e) => BelongsToCollectionData(id: e.id, name: e.name, posterPath: e.posterPath, backdropPath: e.backdropPath)).toList();
    // }

    data.actorsData =
        details.credits.cast.map((e) => MovieDetailsMovieActorData(name: e.name, character: e.character, profilePath: e.profilePath, id: e.id)).toList();

    // data.similarData = details.similar.similar.map((e) => MovieDetailsSimilarData(id: e.id, title: e.title, posterPath: e.posterPath, genreIds: e.genreIds)).toList();

    data.favoriteData.isFavorite = isFavorite;
    data.watchlistData.isWatchlist = isWatchlist;



    data.recommendationsData = details.recommendations.recommendationsList
        .map((e) => MovieDetailsRecommendationsData(id: e.id, title: e.title, posterPath: e.posterPath, backdropPath: e.backdropPath))
        .toList();

    // data.externalIds = details.externalIds.map((e) => MovieDetailsExternalIdsData(id: e.id, imdbId: e.imdbId, instagramId: e.instagramId, wikidataId: e.wikidataId, facebookId: e.facebookId, twitterId: e.twitterId)).toList();

    data.allVideosData = details.videos.results
        .map((e) => MovieDetailsAllVideosData(
            name: e.name, key: e.key, site: e.site, size: e.size, type: e.type, official: e.official, publishedAt: e.publishedAt, id: e.id))
        .toList();

    var id = data.id;
    var title = data.title;
    var tagline = data.tagline;
    var overview = data.overview;
    var voteAverage = data.voteAverage;
    var voteCount = data.voteCount;
    var popularity = data.popularity;
    var releaseDate = data.releaseDate;
    var summary = data.summary;
    var genres = data.genres;
    var peopleData = data.peopleData;
    var actorsData = data.actorsData;
    var isLoading = data.isLoading;
    var posterPath = data.posterPath;
    var backdropPath = data.backdropPath;
    var recommendations = data.recommendationsData;
    var videos = data.videosData;
    var allVideos = data.allVideosData;
    // var similar = data.similarData;
    var isFavoriteData = data.favoriteData.isFavorite;
    var isWatchlistData = data.watchlistData.isWatchlist;
    // var facebook = data.facebook;
    var externalIds = data.externalIds;
    // var collection = data.collectionData;

    final newState = state.copyWith(
      id: id,
      backdropPath: backdropPath,
      posterPath: posterPath,
      overview: overview,
      title: title,
      tagline: tagline,
      voteAverage: voteAverage,
      voteCount: voteCount,
      popularity: popularity,
      releaseDate: releaseDate,
      summary: summary,
      genres: genres,
      peopleData: peopleData,
      actorsData: actorsData,
      isLoading: isLoading,
      isFavorite: isFavoriteData,
      isWatchlist: isWatchlistData,
      recommendations: recommendations,
      videos: videos,
      allVideos: allVideos,
      // facebook: facebook,
      externalIds: externalIds,
      // similar: similar,
      // collection: collection,
    );
    emit(newState);
  }

  List<MovieDetailsVideosData>? makeTrailerKey(MovieDetails details) {
    final videos = details.videos.results.where((video) => video.type == "Trailer" && video.site == 'YouTube');
    if (videos.isNotEmpty) {
      String trailerKey = videos.first.key;
      var videosData = details.videos.results.map((e) => MovieDetailsVideosData(key: trailerKey)).toList();
      return videosData;
    } else {
      return null;
    }
  }

  String makeReleaseDate(MovieDetails details) {
    var texts = <String>[];
    final releaseDate = details.releaseDate;
    if (releaseDate != null) {
      texts.add(_dateFormat.format(releaseDate));
    }
    return texts.join(' ');
  }

  String makeSummary(MovieDetails details) {
    var texts = <String>[];
    if (details.productionCountries.isNotEmpty) {
      texts.add('(${details.productionCountries.first.iso})');
    }
    final runtime = details.runtime ?? 0;
    final duration = Duration(minutes: runtime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    texts.add('${hours}h ${minutes}min');
    return texts.join(' ');
  }

  String makeGenres(MovieDetails details) {
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

  List<List<MovieDetailsMoviePeopleData>> makePeopleData(MovieDetails details) {
    var crew = details.credits.crew.map((e) => MovieDetailsMoviePeopleData(name: e.name, job: e.job)).toList();
    crew = crew.length > 4 ? crew.sublist(0, 4) : crew;
    var crewChunks = <List<MovieDetailsMoviePeopleData>>[];
    for (var i = 0; i < crew.length; i += 2) {
      crewChunks.add(crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2));
    }
    return crewChunks;
  }

  void toggleFavoriteMovie(BuildContext context) {
    data.favoriteData = data.favoriteData.copyWith(isFavorite: !data.favoriteData.isFavorite);
    try {
      _movieService.updateFavoriteMovie(movieId: movieId, isFavorite: data.favoriteData.isFavorite);
      var newState = state.copyWith(isFavorite: data.favoriteData.isFavorite);
      emit(newState);
    } on ApiClientException catch (e) {
      _handleApiClientException(e);
    }
  }

  void toggleWatchlistMovie(BuildContext context) {
    data.watchlistData = data.watchlistData.copyWith(isWatchlist: !data.watchlistData.isWatchlist);
    try {
      _movieService.updateWatchlistMovie(movieId: movieId, isWatchlist: data.watchlistData.isWatchlist);
      var newState = state.copyWith(isWatchlist: data.watchlistData.isWatchlist);
      emit(newState);
    } on ApiClientException catch (e) {
      _handleApiClientException(e);
    }
  }

  void onDetailsTap(BuildContext context, int index) {
    final id = state.id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetailsFullCastAndCrewList, arguments: id);
  }
}
