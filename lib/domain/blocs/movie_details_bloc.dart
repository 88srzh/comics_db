import 'package:bloc/bloc.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/services/auth_view_cubit.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';

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

  const MovieDetailsContainer.initial() : movieId = 0;
}

class MovieDetailsState {
  final MovieDetailsContainer movieDetailsContainer;

  MovieDetailsState({required this.movieDetailsContainer});

  List<MovieDetails> get details => movieDetailsContainer.;

  MovieDetailsState.initial() : movieDetailsContainer = const MovieDetailsContainer.initial();

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
  final _movieService = MovieService();
  final _authService = AuthService();

  MovieDetailsBloc(MovieDetailsState initialState) : super(initialState) {
    on<MovieDetailsEvent>(((event, emit) async {
      if (event is MovieDetailsEventLoadPage) {
        await onMovieDetailsLoadPage(event, emit);
      }
    }));
  }

  Future<void> onMovieDetailsLoadPage(MovieDetailsEventLoadPage event, Emitter<MovieDetailsState> emit) async {
    final movieId = state.movieDetailsContainer.movieId;
    // TODO: Большие сомнения, что это заработает
    final result = await _movieApiClient.movieDetails(movieId, event.locale);
    final container = state.movieDetailsContainer.copyWith(
      movieId: result.id,
    );
    final newState = state.copyWith(movieDetailsContainer: container);
    emit(newState);
    updateData(details.details, details.isFavorite);
  }
}

// void _handleApiClientException(ApiClientException exception,
// BuildContext context
// ) {
// switch (exception.type) {
//   case ApiClientExceptionType.sessionExpired:
//     _authService.logout();
//     MainNavigation.resetNavigation(context);
// break;
// default:
//   print(exception);
// }
// }}

void updateData(MovieDetails? details, bool isFavorite) {
  data.title = details?.title ?? 'Loading...';
  data.tagline = details?.tagline ?? 'No tagline';
  data.isLoading = details == null;
  if (details == null) {
    final container = state.movieDe
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
        (e) => MovieDetailsMovieActorData(
          name: e.name,
          character: e.character,
          profilePath: e.profilePath,
        ),
      )
      .toList();
  notifyListeners();
}
//
// Future<void> toggleFavoriteMovie(BuildContext context) async {
//   data.posterData = data.posterData.copyWith(isFavorite: !data.posterData.isFavorite);
//   notifyListeners();
//   try {
//     await _movieService.updateFavoriteMovie(movieId: movieId, isFavorite: data.posterData.isFavorite);
//   } on ApiClientException catch (e) {
//     _handleApiClientException(e, context);
//   }
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
