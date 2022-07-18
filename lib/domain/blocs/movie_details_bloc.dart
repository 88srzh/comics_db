import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/widgets/localized_model_storage.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

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

  MovieDetailsContainer get details => movieDetailsContainer;

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
    // if (state.details != null) {
    //   final result = await _movieApiClient.movieDetails(movieId, event.locale);
    //   return result;
    // }
    // final container = state.movieDetailsContainer.copyWith(movieId: result.id);
    // final newState = state.copyWith(movieDetailsContainer: container);
    // emit(newState);
    updateData(details.details, details.isFavorite, data);
  }
}
