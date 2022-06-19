import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/popular_and_top_rated_movie_response.dart';

abstract class MovieListEvent {}

class MovieListEventLoadNextPage extends MovieListEvent {
  final String locale;

  MovieListEventLoadNextPage(this.locale);
}

class MovieListEventLoadReset extends MovieListEvent {}

class MovieListEventSearchMovie extends MovieListEvent {
  final String query;

  MovieListEventSearchMovie(this.query);
}

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

class MovieListState {
  final MovieListContainer popularMovieContainer;
  final MovieListContainer searchMovieContainer;
  final String searchQuery;

  MovieListState.initial()
      : popularMovieContainer = const MovieListContainer.initial(),
        searchMovieContainer = const MovieListContainer.initial(),
        searchQuery = '';

  bool get isSearchMode => searchQuery.isNotEmpty;

  MovieListState({
    required this.popularMovieContainer,
    required this.searchMovieContainer,
    required this.searchQuery,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieListState &&
          runtimeType == other.runtimeType &&
          popularMovieContainer == other.popularMovieContainer &&
          searchMovieContainer == other.searchMovieContainer &&
          searchQuery == other.searchQuery;

  @override
  int get hashCode => popularMovieContainer.hashCode ^ searchMovieContainer.hashCode ^ searchQuery.hashCode;

  MovieListState copyWith({
    MovieListContainer? popularMovieContainer,
    MovieListContainer? searchMovieContainer,
    String? searchQuery,
  }) {
    return MovieListState(
        popularMovieContainer: popularMovieContainer ?? this.popularMovieContainer,
        searchMovieContainer: searchMovieContainer ?? this.searchMovieContainer,
        searchQuery: searchQuery ?? this.searchQuery);
  }
}

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();

  MovieListBloc(MovieListState initialState) : super(initialState) {
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
      _loadNextPage(state.searchMovieContainer, (nextPage) async {
        final result = await _movieApiClient.searchMovie(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
        return result;
      });

      if (state.searchMovieContainer.isComplete) return;
      final nextPage = state.searchMovieContainer.currentPage + 1;
      final result = await _movieApiClient.searchMovie(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
      final movies = state.popularMovieContainer.movies;
      movies.addAll(result.movies);
      final container = state.searchMovieContainer.copyWith(
        movies: movies,
        currentPage: result.page,
        totalPage: result.totalPages,
      );
      final newState = state.copyWith(searchMovieContainer: container);
      emit(newState);
    } else {
      if (state.popularMovieContainer.isComplete) return;
      final nextPage = state.popularMovieContainer.currentPage + 1;
      final result = await _movieApiClient.popularMovie(nextPage, event.locale, Configuration.apiKey);
      final movies = state.popularMovieContainer.movies;
      movies.addAll(result.movies);
      final container = state.popularMovieContainer.copyWith(
        movies: movies,
        currentPage: result.page,
        totalPage: result.totalPages,
      );
      final newState = state.copyWith(popularMovieContainer: container);
      emit(newState);
    }
  }

  Future<MovieListContainer?> _loadNextPage(
      MovieListContainer container, Future<PopularAndTopRatedMovieResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.popularMovieContainer.currentPage + 1;
    final result = await loader(nextPage);
    final movies = container.movies;
    movies.addAll(result.movies);
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
