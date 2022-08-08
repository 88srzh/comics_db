import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/localized_model_storage.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'movie_details_new_state.dart';

class MovieDetailsNewCubit extends Cubit<MovieDetailsCubitNewState> {
  late DateFormat _dateFormat;
  final data = MovieDetailsData();
  final posterData = MovieDetailsPosterData(
    title: '',
    voteCount: 0,
    popularity: 0,
  );
  final String overview = '';
  final String posterPath = '';
  String _locale = '';
  final _movieService = MovieService();
  final int movieId;
  final _localeStorage = LocalizedModelStorage();
  final _movieApiClient = MovieAndTvApiClient();
  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;

  MovieDetailsNewCubit(this.movieId)
      // TODO should fix
      : super(const MovieDetailsCubitNewState(overview: '', localeTag: '', posterPath: '')) {
    emit(MovieDetailsCubitNewState(
      overview: state.overview,
      localeTag: state.localeTag,
      posterPath: state.posterPath,
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
    // loadMovieDetails(context);
    // loadMovieDetails();
    // не уверен, что first правильно передаст id
    // movieDetailsNewBloc.add(MovieDetailsNewEventLoadDetailsPage(localeTag, state.movies[index].id));
  }

  /*@override
  Future<void> close() {
    movieDetailsBlocSubscription.cancel();
    return super.close();
  }*/

  MovieListData _makeDetailsListData(MovieDetails details) {
    final releaseDate = details.releaseDate;
    final releaseDateTitle = releaseDate != null ? _dateFormat.format(releaseDate) : '';
    return MovieListData(
      title: details.title,
      posterPath: details.posterPath,
      backdropPath: details.backdropPath,
      id: details.id,
      originalTitle: details.originalTitle,
      overview: details.overview,
      releaseDate: releaseDateTitle,
    );
  }

  // void onMovieTap(BuildContext context, int index) {
  //   var movies = <MovieListData>[];
  //   final id = movies[index].id;
  // final id = mov[index].id;
  // Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  // }

  void updateData(MovieDetails? details /* bool isFavorite*/) {
    // final releaseDate = details?.releaseDate;
    // final releaseDateTitle = releaseDate != null ? _dateFormat.format(releaseDate) : '';
    data.overview = details?.overview ?? 'No description';
    data.posterData = MovieDetailsPosterData(
      title: details?.title ?? '',
      voteCount: details?.voteCount ?? 0,
      popularity: details?.popularity ?? 0,
      posterPath: details?.posterPath ?? '',
    );
    var overview = data.overview;
    final newState = state.copyWith(overview: overview);
    emit(newState);

    // return MovieListData(
    //   title: details.title,
    //   posterPath: details.posterPath,
    //   backdropPath: details.backdropPath,
    //   id: details.id,
    //   originalTitle: details.originalTitle,
    //   overview: details.overview,
    //   releaseDate: releaseDateTitle,
  }
}
