import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsCubitState> {
  late DateFormat _dateFormat;
  final data = MovieDetailsData();
  final String overview = '';
  final String posterPath = '';
  final String title = '';
  String _locale = '';
  final _movieService = MovieService();
  final int movieId;

  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;

  MovieDetailsCubit(this.movieId)
      // TODO should fix
      : super(const MovieDetailsCubitState(
          overview: '',
          localeTag: '',
          posterPath: '',
          title: '',
          tagline: '',
          voteCount: 0,
          popularity: 0,
          releaseDate: '',
          summary: '',
          voteAverage: 0,
          backdropPath: '',
        )) {
    emit(MovieDetailsCubitState(
      overview: state.overview,
      localeTag: state.localeTag,
      posterPath: state.posterPath,
      title: state.title,
      tagline: state.tagline,
      voteCount: state.voteCount,
      popularity: state.popularity,
      releaseDate: state.releaseDate,
      summary: state.summary,
      voteAverage: state.voteAverage,
      backdropPath: state.backdropPath,
    ));
  }

  Future<void> loadMovieDetails(BuildContext context) async {
    // try {
    final details = await _movieService.loadMovieDetails(movieId: movieId, locale: state.localeTag);
    //   final details = await _movieApiClient.movieDetails(movieId, _locale);
    // emit(MovieDetailsCubitNewState(overview: state.overview, localeTag: state.localeTag));
    // updateData(details.details, details.isFavorite);
    updateData(details.details);
    // }
    // on ApiClientException catch (e) {
    //   _handleApiClientException(e, context);
    // }
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

  Future<void> setupMovieDetailsLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    // if (state.localeTag == localeTag) return;
    // if (!_localeStorage.updateLocale(locale)) return;
    // final newState = state.copyWith(localeTag: localeTag);
    // emit(newState);
    // _dateFormat = DateFormat.yMMMd(localeTag);
    updateData(null);
    await loadMovieDetails(context);
  }

  // void onMovieTap(BuildContext context, int index) {
  //   var movies = <MovieListData>[];
  //   final id = movies[index].id;
  // final id = mov[index].id;
  // Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  // }

  void updateData(MovieDetails? details /* bool isFavorite*/) {
    // final releaseDate = details?.releaseDate;
    // final releaseDateTitle = releaseDate != null ? _dateFormat.format(releaseDate).toString() : '';
    data.releaseDate = makeReleaseDate(details);
    // data.summary = makeSummary(details);
    data.overview = details?.overview ?? 'Loading description...';
    // TODO: title twice in posterData
    data.title = details?.title ?? 'Loading title..';
    data.tagline = details?.tagline ?? 'Loading tagline..';
    data.posterData = MovieDetailsPosterData(
      title: details?.title ?? '',
      voteCount: details?.voteCount ?? 0,
      popularity: details?.popularity ?? 0,
      posterPath: details?.posterPath ?? '',
      voteAverage: details?.voteAverage,
      backdropPath: details?.backdropPath ?? '',
    );
    var overview = data.overview;
    var title = data.title;
    var tagline = data.tagline;
    var voteCount = data.posterData.voteCount;
    var popularity = data.posterData.popularity;
    String releaseDate = data.releaseDate;
    var summary = data.summary;
    double? voteAverage = data.posterData.voteAverage;
    var backdropPath = data.posterData.backdropPath;
    var posterPath = data.posterData.posterPath;
    final newState = state.copyWith(
      overview: overview,
      posterPath: posterPath,
      title: title,
      tagline: tagline,
      voteCount: voteCount,
      popularity: popularity,
      releaseDate: releaseDate,
      summary: summary,
      voteAverage: voteAverage,
      backdropPath: backdropPath,
    );
    emit(newState);
  }

  String makeReleaseDate(MovieDetails? details) {
    var texts = <String>[];
    final releaseDate = details?.releaseDate;
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
}
