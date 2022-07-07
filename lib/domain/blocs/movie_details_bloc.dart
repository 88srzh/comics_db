import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/services/auth_view_cubit.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/actor_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

// import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

abstract class MovieDetailsEvent {}

class MovieDetailsEventLoadPage extends MovieDetailsEvent {
  final String locale;

  MovieDetailsEventLoadPage(this.locale);
}

class MovieDetailsContainer {
  final int movieId;

  const MovieDetailsContainer({
    required this.movieId,
  });

  MovieDetailsContainer copyWith({
    int? movieId,
  }) {
    return MovieDetailsContainer(
      movieId: movieId ?? this.movieId,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsContainer && runtimeType == other.runtimeType && movieId == other.movieId;

  @override
  int get hashCode => movieId.hashCode;

// const MovieDetailsContainer.initial() : movieId = 0;
}

class MovieDetailsState {
  final MovieDetailsContainer movieDetailsContainer;

  MovieDetailsState({required this.movieDetailsContainer});

  // MovieDetailsContainer get details => movieDetailsContainer;

  // MovieDetailsState.initial() : movieDetailsContainer = const MovieDetailsContainer.initial();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsState &&
          runtimeType == other.runtimeType &&
          movieDetailsContainer == other.movieDetailsContainer;

  @override
  int get hashCode => movieDetailsContainer.hashCode;

  MovieDetailsState copyWith({
    MovieDetailsContainer? movieDetailsContainer,
  }) {
    return MovieDetailsState(
      movieDetailsContainer: movieDetailsContainer ?? this.movieDetailsContainer,
    );
  }
}

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final _movieApiClient = MovieAndTvApiClient();
  final _authService = AuthService();
  final int movieId;

  MovieDetailsBloc(MovieDetailsState initialState, this.movieId) : super(initialState) {
    on<MovieDetailsEvent>(((event, emit) async {
      if (event is MovieDetailsEventLoadPage) {
        await onMovieDetailsLoadPage(event, emit);
      }
    }));
  }

  Future<void> onMovieDetailsLoadPage(MovieDetailsEventLoadPage event, Emitter<MovieDetailsState> emit) async {
    final movieId = state.movieDetailsContainer.movieId;
    final result = await _movieApiClient.movieDetails(movieId, event.locale);
    final container = state.movieDetailsContainer.copyWith(movieId: result.id);
    final newState = state.copyWith(movieDetailsContainer: container);
    emit(newState);
    // updateData(null, false);
  }
}

class MovieDetailsData {
  String title = '';
  String tagline = '';
  bool isLoading = true;
  String overview = '';
  MovieDetailsPosterData posterData = MovieDetailsPosterData(title: '', voteCount: 0, popularity: 0);
  String summary = '';
  String releaseDate = '';
  String genres = '';
  MovieDetailsTrailerData trailerData = MovieDetailsTrailerData();
  List<List<MovieDetailsMoviePeopleData>> peopleData = const <List<MovieDetailsMoviePeopleData>>[];
  List<MovieDetailsMovieActorData> actorsData = const <MovieDetailsMovieActorData>[];
}
