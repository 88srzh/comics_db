import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/blocs/movie_details_bloc.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/services/auth_view_cubit.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/actor_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit.dart';
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
  final data = MovieDetailsData();
  MovieDetailsPosterData posterData = MovieDetailsPosterData(title: '', voteCount: 0, popularity: 0);
  final int movieId;
  late final StreamSubscription<MovieDetailsState> movieDetailsBlocSubscription;
  var movies = <MovieListData>[];
  late DateFormat _dateFormat;

  MovieDetailsCubit(this.movieDetailsBloc, this.movieId) : super(MovieDetailsCubitState(localeTag: '')) {
    Future.microtask(
          () {
        _onState(movieDetailsBloc.state);
        movieDetailsBlocSubscription = movieDetailsBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(MovieDetailsState state) {
  }

  void onMovieTap(BuildContext context, int index) {
    final id = movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  void updateData(MovieDetails? details, bool isFavorite) {
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
    data.releaseDate = makeReleaseDate(details);
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

  String makeReleaseDate(MovieDetails details) {
    var texts = <String>[];
    final releaseDate = details.releaseDate;
    if (releaseDate != null) {
      texts.add(_dateFormat.format(releaseDate));
    }
    return texts.join(' ');
  }

  // Future<void> toggleFavoriteMovie(BuildContext context) async {
  //   data.posterData = data.posterData.copyWith(isFavorite: !data.posterData.isFavorite);
  //   notifyListeners();
    // try {
    //   await _movieService.updateFavoriteMovie(movieId: movieId, isFavorite: data.posterData.isFavorite);
    // } on ApiClientException catch (e) {
    //   _handleApiClientException(e, context);
    // }
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
}

// MovieDetailsPosterData _makeDetailsPosterData(MovieDetails details) {
//   return MovieDetailsPosterData(
//     title: details.title,
//     voteCount: details.voteCount,
//     popularity: details.popularity,
//   );
// }

// void updateData(MovieDetails? details, bool isFavorite) {
//   data.title = details?.title ?? 'Loading...';
//   data.tagline = details?.tagline ?? 'No tagline';
//   data.isLoading = details == null;
//   if (details == null) {
//     notifyListeners();
// return;
// }
// data.overview = details.overview ?? 'No description';
// data.posterData = MovieDetailsPosterData(
//     posterPath: details.posterPath,
//     backdropPath: details.backdropPath,
//     isFavorite: isFavorite,
//     title: details.title,
//     tagline: details.tagline,
//     voteAverage: details.voteAverage.toString(),
//     voteCount: details.voteCount,
//     popularity: details.popularity);
// var year = details.releaseDate?.year.toString();
// year = year != null ? ' ($year)' : '';
// final videos = details.videos.results.where((video) => video.type == 'Trailer' && video.site == 'YouTube');
// final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
// data.trailerData = MovieDetailsTrailerData(trailerKey: trailerKey);
// data.summary = makeSummary(details);
// data.releaseDate = makeReleaseDate(details);
// data.genres = makeGenres(details);
// data.peopleData = makePeopleData(details);
// data.actorsData = details.credits.cast
//     .map(
//       (e) => MovieDetailsMovieActorData(name: e.name, character: e.character, profilePath: e.profilePath),
//     )
//     .toList();
// notifyListeners();
//
// нужно ли тут сравнение?

// emit(state);
// }
//
// Future<void> toggleFavoriteMovie(BuildContext context) async {
//   data.posterData = data.posterData.copyWith(isFavorite: !data.posterData.isFavorite);
//   notifyListeners();
// try {
//   await _movieService.updateFavoriteMovie(movieId: movieId, isFavorite: data.posterData.isFavorite);
// } on ApiClientException catch (e) {
//   _handleApiClientException(e, context);
// }
// }
//
// List<List<MovieDetailsMoviePeopleData>> makePeopleData(MovieDetails details) {
//   var crew = details.credits.crew.map((e) => MovieDetailsMoviePeopleData(name: e.name, job: e.job)).toList();
//   crew = crew.length > 4 ? crew.sublist(0, 4) : crew;
//   var crewChunks = <List<MovieDetailsMoviePeopleData>>[];
//   for (var i = 0; i < crew.length; i += 2) {
//     crewChunks.add(
//       crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2),
//     );
//   }
//   return crewChunks;
// }
//
// String makeSummary(MovieDetails details) {
//   var texts = <String>[];
//   if (details.productionCountries.isNotEmpty) {
//     texts.add('(${details.productionCountries.first.iso})');
//   }
//   final runtime = details.runtime ?? 0;
//   final duration = Duration(minutes: runtime);
//   final hours = duration.inHours;
//   final minutes = duration.inMinutes.remainder(60);
//   texts.add('${hours}h ${minutes}min');
//   return texts.join(' ');
// }
//
// String makeGenres(MovieDetails details) {
//   var texts = <String>[];
//   if (details.genres.isNotEmpty) {
//     var genresNames = <String>[];
//     for (var genr in details.genres) {
//       genresNames.add(genr.name);
//     }
//     texts.add(genresNames.join(', '));
//   }
//   return texts.join(' ');
// }
//
// String makeReleaseDate(MovieDetails details) {
//   var texts = <String>[];
//   final releaseDate = details.releaseDate;
//   if (releaseDate != null) {
//     texts.add(_dateFormat.format(releaseDate));
//   }
//   return texts.join(' ');
// }
//
// void _handleApiClientException(ApiClientException exception, BuildContext context) {
//   switch (exception.type) {
//     case ApiClientExceptionType.sessionExpired:
//       _authService.logout();
//       MainNavigation.resetNavigation(context);
//       break;
//     default:
//       print(exception);
//   }
// }
// }

// List<List<MovieDetailsMoviePeopleData>> makePeopleData(MovieDetails details) {
//   var crew = details.credits.crew.map((e) => MovieDetailsMoviePeopleData(name: e.name, job: e.job)).toList();
//   crew = crew.length > 4 ? crew.sublist(0, 4) : crew;
//   var crewChunks = <List<MovieDetailsMoviePeopleData>>[];
//   for (var i = 0; i < crew.length; i += 2) {
//     crewChunks.add(
//       crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2),
//     );
//   }
//   return crewChunks;
// }
//
// String makeSummary(MovieDetails details) {
//   var texts = <String>[];
//   if (details.productionCountries.isNotEmpty) {
//     texts.add('(${details.productionCountries.first.iso})');
//   }
// final runtime = details.runtime ?? 0;
// final duration = Duration(minutes: runtime);
// final hours = duration.inHours;
// final minutes = duration.inMinutes.remainder(60);
// texts.add('${hours}h ${minutes}min');
// return texts.join(' ');
// }
//
// String makeGenres(MovieDetails details) {
//   var texts = <String>[];
//   if (details.genres.isNotEmpty) {
//     var genresNames = <String>[];
//     for (var genr in details.genres) {
//       genresNames.add(genr.name);
//     }
//     texts.add(genresNames.join(', '));
//   }
//   return texts.join(' ');
// }
//
// String makeReleaseDate(MovieDetails details) {
//   var texts = <String>[];
//   final releaseDate = details.releaseDate;
//   if (releaseDate != null) {
//     texts.add(_dateFormat.format(releaseDate));
//   }
//   return texts.join(' ');
}
