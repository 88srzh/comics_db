import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie.dart';

abstract class MovieListEvent {}

class MovieListEventLoadNextPage extends MovieListEvent {}

class MovieListEventLoadReset extends MovieListEvent {}

class MovieListEventSearchMovie extends MovieListEvent {
  final String query;

  MovieListEventSearchMovie(this.query);
}

class MovieListContainer {
  final List<Movie> movies;
  final int currentPage;
  final int totalPage;

  const MovieListContainer.initial()
      : movies = const <Movie>[],
        currentPage = 0,
        totalPage = 1;

  MovieListContainer({required this.movies, required this.currentPage, required this.totalPage});
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
}

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();

  MovieListBloc(MovieListState initialState) : super(initialState) {
    on<MovieListEvent>(((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onAuthCheckStatusEvent(event, emit);
      } else if (event is MovieListEventLoadReset) {
        await onAuthLogInEvent(event, emit);
      } else if (event is MovieListEventSearchMovie) {
        await onAuthLogoutEvent(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onMovieListEventLoadNextPage(MovieListEventLoadNextPage event, Emitter<MovieListState> emitter) async {
    if (state.isSearchMode) {
      await _searchMoviePaginator.loadNextMoviesPage();
    } else {
      await _popularMoviePaginator.loadNextMoviesPage();
    }
    // try {
    //   await _sessionDataProvider.deleteSessionId();
    //   await _sessionDataProvider.deleteAccountId();
    // } catch (e) {
    //   emit(AuthFailureState(e));
    // }
  }

  Future<void> onMovieListEventLoadReset(MovieListEventLoadReset event, Emitter<MovieListState> emitter) async {
    emit(MovieListState.initial());
    add(MovieListEventLoadNextPage());
  }

  Future<void> onMovieListEventSearchMovie(MovieListEventSearchMovie event, Emitter<MovieListState> emitter) async {}
}
