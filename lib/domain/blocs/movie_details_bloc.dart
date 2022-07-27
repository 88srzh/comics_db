import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/local_entity/movie_details_local.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/widgets/localized_model_storage.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';

abstract class MovieDetailsEvent {}

class MovieDetailsEventLoadPage extends MovieDetailsEvent {
  final String locale;

  MovieDetailsEventLoadPage(this.locale);
}

class MovieDetailsBlocData {
  String title;
  String tagline;
  bool isLoading;
  String overview;

  // MovieDetailsPosterData posterData = MovieDetailsPosterData(title: '', voteCount: 0, popularity: 0);
  String summary;
  String releaseDate;
  String genres;

  // MovieDetailsTrailerData trailerData = MovieDetailsTrailerData();
  // List<List<MovieDetailsMoviePeopleData>> peopleData = const <List<MovieDetailsMoviePeopleData>>[];

  // MovieDetailsBlocData.initial()
  //     : title = '',
  //       tagline = '',
  //       isLoading = true,
  //       overview = '',
  // posterData = const List<MovieDetailsPosterData>[],
  //       summary = '',
  //       releaseDate = '',
  //       genres = '';

  // trailerData = '', '';

  MovieDetailsBlocData({
    required this.title,
    required this.tagline,
    required this.isLoading,
    required this.overview,
    // required this.posterData,
    required this.summary,
    required this.releaseDate,
    required this.genres,
    // required this.trailerData,
    // required this.peopleData,

  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MovieDetailsBlocData && runtimeType == other.runtimeType && title == other.title &&
              tagline == other.tagline && isLoading == other.isLoading && overview == other.overview &&
              summary == other.summary && releaseDate == other.releaseDate && genres == other.genres;

  @override
  int get hashCode =>
      title.hashCode ^ tagline.hashCode ^ isLoading.hashCode ^ overview.hashCode ^ summary.hashCode ^ releaseDate
          .hashCode ^ genres.hashCode;

  MovieDetailsBlocData copyWith({
    String? title,
    String? tagline,
    bool? isLoading,
    String? overview,
    String? summary,
    String? releaseDate,
    String? genres,
  }) {
    return MovieDetailsBlocData(
      title: title ?? this.title,
      tagline: tagline ?? this.tagline,
      isLoading: isLoading ?? this.isLoading,
      overview: overview ?? this.overview,
      summary: summary ?? this.summary,
      releaseDate: releaseDate ?? this.releaseDate,
      genres: genres ?? this.genres,
    );
  }

}

class MovieDetailsState {
  final MovieDetailsBlocData movieDetailsBlocData;

  MovieDetailsState.initial() : movieDetailsBlocData = MovieDetailsBlocData(
    title: '',
    tagline: '',
    isLoading: true,
    overview: '',
    // posterData
    summary: '',
    releaseDate: '',
    genres: '',
    // trailerData: '',
    // peopleData: '',
  );

  MovieDetailsState({required this.movieDetailsBlocData});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MovieDetailsState &&
              runtimeType == other.runtimeType &&
              movieDetailsBlocData == other.movieDetailsBlocData;

  @override
  int get hashCode => movieDetailsBlocData.hashCode;

  MovieDetailsState copyWith({
    MovieDetailsBlocData? movieDetailsBlocData,
  }) {
    return MovieDetailsState(
      movieDetailsBlocData: movieDetailsBlocData ?? this.movieDetailsBlocData,
    );
  }
// MovieDetailsBlocData get movieDetails => movieDetailsBlocData;

}

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  // final _movieApiClient = MovieAndTvApiClient();
  // final _authService = AuthService();
  final _movieService = MovieService();
  final _localeStorage = LocalizedModelStorage();
  final int movieId;
  final data = MovieDetailsData();

  MovieDetailsBloc(MovieDetailsState initialState, this.movieId) : super(initialState) {
    on<MovieDetailsEvent>(
      ((event, emit) async {
        if (event is MovieDetailsEventLoadPage) {
          await movieDetailsLoadPage(event, emit);
        }
      }),
    );
  }

  Future<void> movieDetailsLoadPage(MovieDetailsEventLoadPage event, Emitter<MovieDetailsState> emit) async {
    // final movieId = state.movieDetailsContainer.movieId;
    final details = await _movieService.loadMovieDetails(movieId: movieId, locale: _localeStorage.localeTag);
    // _handleApiClientException(e, context);
    // if (state.details != null) {
    //   final result = await _movieApiClient.movieDetails(movieId, event.locale);
    //   return result;
    // }
    // final container = state.movieDetailsContainer.copyWith(movieId: result.id);
    // final newState = state.copyWith(movieDetailsContainer: container);
    // emit(newState);
    // updateData(details.details, details.isFavorite, data);
    // return details;
    //   final posterData = List<MovieDetailsPosterData>.from(state.movieDetailsBlocData.posterData)..addAll(details.details.)
    final container = state.movieDetailsBlocData.copyWith(
      title: details.details.title,
      tagline: details.details.tagline,
      overview: details.details.overview,
      // posterData
      // trailerData
      // peopleData
      // actorsData
      // summary
      // releaseDate: details.details.releaseDate,
    );
    final newState = state.copyWith(movieDetailsBlocData: container);
    emit(newState);
  }

  void _handleApiClientException(ApiClientException exception, BuildContext context) {
    switch (exception.type) {
      case ApiClientExceptionType.sessionExpired:
      // _authService.logout();
      // MainNavigation.resetNavigation(context);
        break;
      default:
        print(exception);
    }
  }
}
