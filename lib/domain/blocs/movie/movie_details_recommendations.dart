// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_container.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';

class MovieDetailsRecommendationsBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();
  int movieId;

  MovieDetailsRecommendationsBloc(MovieListState initialState, this.movieId) : super(initialState) {
    on<MovieListEvent>(((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onMovieDetailsRecommendationsLoadNextPage(event, emit);
      } else if (event is MovieListEventLoadReset) {
        await onMovieDetailsRecommendationsLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onMovieDetailsRecommendationsLoadNextPage(
      MovieListEventLoadNextPage event, Emitter<MovieListState> emit) async {
    final container = await loadNextPage(state.movieContainer, (nextPage) async {
      final result = await _movieApiClient.movieRecommendations(movieId, event.locale);
      return result;
    });
    if (container != null) {
      final newState = state.copyWith(movieContainer: container);
      emit(newState);
    }
  }

// TODO repeat in other blocs
  Future<MovieListContainer?> loadNextPage(
      MovieListContainer container, Future<MovieResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.movieContainer.currentPage + 1;
    final result = await loader(nextPage);
    final movies = List<Movie>.from(container.movies)..addAll(result.movies);
    final newContainer = container.copyWith(
      movies: movies,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }

  Future<void> onMovieDetailsRecommendationsLoadReset(
      MovieListEventLoadReset event, Emitter<MovieListState> emit) async {
    emit(const MovieListState.initial());
  }
}
