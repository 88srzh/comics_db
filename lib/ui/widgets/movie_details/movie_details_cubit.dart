<<<<<<< HEAD
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_data.dart';
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
  final String? trailerData = MovieDetailsTrailerData().trailerKey;

  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;

  MovieDetailsCubit(this.movieId)
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
          trailerData: '',
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
      trailerData: state.trailerData,
    ));
  }

  Future<void> loadMovieDetails(BuildContext context) async {
    try {
      final details = await _movieService.loadMovieDetails(movieId: movieId, locale: state.localeTag);
      // updateData(details.details, details.isFavorite);
      updateData(details.details);
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
    final videos = details!.videos.results.where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
    data.trailerData = MovieDetailsTrailerData(trailerKey: trailerKey);
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
    var trailerData = data.trailerData.toString();
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
      trailerData: trailerData,
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
=======
/*
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/movie_details_bloc.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/localized_model_storage.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/actor_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetailsCubitState {
  final String localeTag;

  MovieDetailsCubitState({required this.localeTag});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCubitState && runtimeType == other.runtimeType && localeTag == other.localeTag;

  @override
  int get hashCode => localeTag.hashCode;

  MovieDetailsCubitState copyWith({
    String? localeTag,
  }) {
    return MovieDetailsCubitState(
      localeTag: localeTag ?? this.localeTag,
    );
  }
}

class MovieDetailsCubit extends Cubit<MovieDetailsCubitState> {
  final MovieDetailsBloc movieDetailsBloc;

  // final data = MovieDetailsData();
  final _movieService = MovieService();
  MovieDetailsPosterData posterData = MovieDetailsPosterData(title: '', voteCount: 0, popularity: 0);

  // final int movieId;

  // late final StreamSubscription<MovieDetailsState> movieDetailsBlocSubscription;
  late final StreamSubscription<MovieDetailsState> movieDetailsCubitSubscription;
  var movies = <MovieListData>[];
  late DateFormat _dateFormat;
  final _localeStorage = LocalizedModelStorage();

  MovieDetailsCubit({required this.movieDetailsBloc}) : super(MovieDetailsCubitState(localeTag: '')) {
    Future.microtask(
      () {
        // movieDetailsBlocSubscription = movieDetailsBloc.stream.listen(_onState);
        // final cubit = MovieDetailsCubit(movieDetailsBloc: movieId, movieDetailsCubitSubscription, movieId);
        // final movieDetailsCubitSubscription = cubit.stream.listen(print);
        _onState(movieDetailsBloc.state);
        movieDetailsCubitSubscription = movieDetailsBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(MovieDetailsState state) {
    // final movies = state
    // final details = state.details.movieId;
    // emit(details);
    // updateData(details.movieDetails, details.isFavorite);
  }

// void _onState(MovieDetailsState state) {
// final movieId = state.movieDetailsContainer.movieId;
// updateData(null, false);
// }
// context for adding api client exception
//   Future<void> movieDetailsLoadPage(BuildContext context) async {
//     final movieId = state.movieDetailsContainer.movieId;
// final details = await _movieService.loadMovieDetails(movieId: movieId, locale: _localeStorage.localeTag);
// final result = await _movieApiClient.movieDetails(movieId, event.locale);
// final container = state.movieDetailsContainer.copyWith(movieId: result.id);
// final newState = state.copyWith(movieDetailsContainer: container);
// emit(newState);
// updateData(details.details, details.isFavorite);

  void setupLocale(String localeTag) async {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    updateData(null, false, MovieDetailsData());
    movieDetailsBloc.add(MovieDetailsEventLoadPage(localeTag));

    // when add bloc catch apiException
    // movieDetailsBloc.add(MovieDetailsEventLoadPage(localeTag));

    // if (!_localeStorage.updateLocale(locale)) return;
    // _dateFormat = DateFormat.yMMMd(_localeStorage.localeTag);
  }

  @override
  Future<void> close() {
    movieDetailsCubitSubscription.cancel();
    return super.close();
  }

// void onMovieTap(BuildContext context, int index) {
//   final id = movies[index].id;
//   Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
// }
}

void updateData(MovieDetails? details, bool isFavorite, MovieDetailsData data) {
  data.title = details?.title ?? 'Loading...';
  data.tagline = details?.tagline ?? 'No tagline';
  data.isLoading = details == null;
  if (details == null) {
    // notifyListeners();
    return;
  }
  data.overview = details.overview ?? 'No description';
  data.posterData = MovieDetailsPosterData(
      posterPath: details.posterPath,
      backdropPath: details.backdropPath,
      isFavorite: isFavorite,
      title: details.title,
      tagline: details.tagline,
      voteAverage: details.voteAverage.toString(),
      voteCount: details.voteCount,
      popularity: details.popularity);
  var year = details.releaseDate?.year.toString();
  year = year != null ? ' ($year)' : '';
  final videos = details.videos.results.where((video) => video.type == 'Trailer' && video.site == 'YouTube');
  final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
  data.trailerData = MovieDetailsTrailerData(trailerKey: trailerKey);
  data.summary = makeSummary(details);
  // data.releaseDate = makeReleaseDate(details);
  data.genres = makeGenres(details);
  data.peopleData = makePeopleData(details);
  data.actorsData = details.credits.cast
      .map(
        (e) => MovieDetailsMovieActorData(name: e.name, character: e.character, profilePath: e.profilePath),
      )
      .toList();
  // notifyListeners();

  // нужно ли тут сравнение?

  // emit(state);
}

// String makeReleaseDate(MovieDetails details) {
//   var texts = <String>[];
//   final releaseDate = details.releaseDate;
//   if (releaseDate != null) {
//     texts.add(_dateFormat.format(releaseDate));
//   }
//   return texts.join(' ');
// }

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

MovieDetailsPosterData _makeDetailsPosterData(MovieDetails details) {
  return MovieDetailsPosterData(
    title: details.title,
    voteCount: details.voteCount,
    popularity: details.popularity,
  );
}
*/
>>>>>>> main
