import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_event.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_state.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';

class MovieListContainer {
  final List<Movie> movies;
  final int currentPage;
  final int totalPage;

  bool get isComplete => currentPage >= totalPage;

  const MovieListContainer.initial()
      : movies = const <Movie>[],
        currentPage = 0,
        totalPage = 1;

  MovieListContainer({required this.movies, required this.currentPage, required this.totalPage});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieListContainer &&
          runtimeType == other.runtimeType &&
          movies == other.movies &&
          currentPage == other.currentPage &&
          totalPage == other.totalPage;

  @override
  int get hashCode => movies.hashCode ^ currentPage.hashCode ^ totalPage.hashCode;

  MovieListContainer copyWith({List<Movie>? movies, int? currentPage, int? totalPage}) {
    return MovieListContainer(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
    );
  }
}



class MoviePopularListBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();

  MoviePopularListBloc(MovieListState initialState) : super(initialState) {
    on<MovieListEvent>(((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onMovieListEventLoadNextPage(event, emit);
      } else if (event is MovieListEventLoadReset) {
        await onMovieListEventLoadReset(event, emit);
      } else if (event is MovieListEventSearchMovie) {
        await onMovieListEventLoadSearchMovie(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onMovieListEventLoadNextPage(MovieListEventLoadNextPage event, Emitter<MovieListState> emit) async {
    if (state.isSearchMode) {
      final container = await _loadNextPage(
        state.searchMovieContainer,
        (nextPage) async {
          final result = await _movieApiClient.searchMovie(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
          return result;
        },
      );
      if (container != null) {
        final newState = state.copyWith(searchMovieContainer: container);
        emit(newState);
      }
    } else {
      final container = await _loadNextPage(state.movieContainer, (nextPage) async {
        final result = await _movieApiClient.popularMovie(nextPage, event.locale, Configuration.apiKey);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(movieContainer: container);
        emit(newState);
      }
    }
  }

  Future<MovieListContainer?> _loadNextPage(MovieListContainer container, Future<MovieResponse> Function(int) loader) async {
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

  Future<void> onMovieListEventLoadReset(MovieListEventLoadReset event, Emitter<MovieListState> emit) async {
    emit(MovieListState.initial());
    // add(MovieListEventLoadNextPage(event.locale));
  }

  Future<void> onMovieListEventLoadSearchMovie(MovieListEventSearchMovie event, Emitter<MovieListState> emit) async {
    if (state.searchQuery == event.query) return;
    final newState = state.copyWith(searchQuery: event.query, searchMovieContainer: const MovieListContainer.initial());
    emit(newState);
  }
}
