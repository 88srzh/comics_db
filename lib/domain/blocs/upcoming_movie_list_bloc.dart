import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie_list_event.dart';
import 'package:comics_db_app/domain/blocs/movie_list_state.dart';
import 'package:comics_db_app/domain/blocs/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';

class UpcomingMovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();

  UpcomingMovieListBloc(MovieListState initialState) : super(initialState) {
    on<MovieListEvent>(((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onUpcomingMovieListEventLoadNextPage(event, emit);
      } else if (event is MovieListEventLoadReset) {
        await onUpcomingMovieListEventLoadReset(event, emit);
      } else if (event is MovieListEventSearchMovie) {
        await onUpcomingMovieListEventLoadSearch(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onUpcomingMovieListEventLoadNextPage(
      MovieListEventLoadNextPage event, Emitter<MovieListState> emit) async {
    if (state.isSearchMode) {
      final container = await _loadNextPage(state.searchMovieContainer, (nextPage) async {
        final result =
            await _movieApiClient.searchMovie(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(searchMovieContainer: container);
        emit(newState);
      } else {
        final container = await _loadNextPage(state.movieContainer, (nextPage) async {
          final result = await _movieApiClient.upcomingMovie(nextPage, event.locale, Configuration.apiKey);
          return result;
        });
        if (container != null) {
          final newState = state.copyWith(movieContainer: container);
          emit(newState);
        }
      }
    }
  }

  Future<MovieListContainer?> _loadNextPage(
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

  Future<void> onUpcomingMovieListEventLoadReset(MovieListEventLoadReset event, Emitter<MovieListState> emit) async {
    emit(MovieListState.initial());
  }

  Future<void> onUpcomingMovieListEventLoadSearch(MovieListEventSearchMovie event, Emitter<MovieListState> emit) async {
    if (state.searchQuery == event.query) return;
    final newState = state.copyWith(searchQuery: event.query, searchMovieContainer: const MovieListContainer.initial());
    emit(newState);
  }
}
