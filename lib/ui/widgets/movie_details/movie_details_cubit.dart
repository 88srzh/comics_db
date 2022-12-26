import 'dart:async';

import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/actor_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_people_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsCubitState> {
  late DateFormat _dateFormat;
  final data = MovieDetailsData();
  // MovieDetails? details;

  // MovieDetailsTrailerData trailerData = MovieDetailsTrailerData();

  // String _locale = '';
  final _movieService = MovieService();
  final movieAndTvApiClient = MovieAndTvApiClient();
  final int movieId;

  // final _localeStorage = LocalizedModelStorage();

  // MovieDetails? _movieDetails;

  // TODO may be delete isLoading, because it's unnecessary
  bool isLoading = true;

  MovieDetailsCubit(this.movieId)
      // TODO should fix
      : super(const MovieDetailsCubitState(
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
          summary: '',
          genres: '',
          trailerKey: '',
          peopleData: [],
          actorsData: [],
          isLoading: false,
        )) {
    emit(MovieDetailsCubitState(
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
      summary: state.summary,
      genres: state.genres,
      trailerKey: state.trailerKey,
      peopleData: state.peopleData,
      actorsData: state.actorsData,
      isLoading: state.isLoading,
    ));
  }

  Future<void> loadMovieDetails(BuildContext context) async {
    try {
      // final _details = await _movieService.loadMovieDetails(movieId: movieId, locale: state.localeTag);
      final details = await movieAndTvApiClient.movieDetails(movieId, state.localeTag);
      // TODO: add isFavorite to update
      updateData(details);
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
        print('exception other');
        break;
      default:
        print(exception);
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
    updateData(null);
    await loadMovieDetails(context);
  }

  void updateData(MovieDetails? details /* bool isFavorite*/) {
    // may ba i need await somewhere here
    data.isLoading = details == null;
    if (details == null) {
      return;
    }
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
    data.trailerKey = makeTrailerKey(details);

    data.actorsData = details.credits.cast.map((e) => MovieDetailsMovieActorData(name: e.name, character: e.character, profilePath: e.profilePath)).toList();

    data.isLoading = true;

    var title = data.title;
    var tagline = data.tagline;
    var overview = data.overview;
    var voteAverage = data.voteAverage;
    var voteCount = data.voteCount;
    var popularity = data.popularity;
    var releaseDate = data.releaseDate;
    var summary = data.summary;
    var genres = data.genres;
    var trailerKeys = data.trailerKey;
    var peopleData = data.peopleData;
    var actorsData = data.actorsData;
    var isLoading = data.isLoading;
    var posterPath = data.posterPath;
    var backdropPath = data.backdropPath;

    final newState = state.copyWith(
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
      trailerKey: trailerKeys,
      peopleData: peopleData,
      actorsData: actorsData,
      isLoading: isLoading,
    );
    emit(newState);
  }

  String makeTrailerKey(MovieDetails details) {
    final videos = details.videos.results.where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
    // final trailerKey = videos.first.key;
    // return trailerKey;
    if (trailerKey != null) {
      return trailerKey;
    } else {
      return 'no trailer key';
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
      crewChunks.add(
        crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2),
      );
    }
    return crewChunks;
  }
}
