import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_event.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_state.dart';
import 'package:comics_db_app/domain/blocs/movie/now_playing_movie_list_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit_state.dart';
import 'package:intl/intl.dart';

class NowPlayingMovieListCubit extends Cubit<MovieListCubitState> {
  final NowPlayingMovieListBloc nowPlayingMovieListBloc;
  late final StreamSubscription<MovieListState> nowPlayingMoveListBlocSubscription;
  late DateFormat _dateFormat;
  Timer? searchDebounce;
  var movie = <Movie>[];

  NowPlayingMovieListCubit({required this.nowPlayingMovieListBloc}) : super(MovieListCubitState(
      movies: const <MovieListData>[], localeTag: '')) {
    Future.microtask(
          () {
      _onState(nowPlayingMovieListBloc.state);
      nowPlayingMoveListBlocSubscription = nowPlayingMovieListBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(MovieListState state) {
    final movies = state.movies.map(_makeListData).toList();
    final newState = this.state.copyWith(movies: movies);
    emit(newState);
  }

  void setupNowPlayingMovieLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    nowPlayingMovieListBloc.add(MovieListEventLoadReset());
    nowPlayingMovieListBloc.add(MovieListEventLoadNextPage(localeTag));
  }

  @override
  Future<void> close() {
    nowPlayingMoveListBlocSubscription.cancel();
    return super.close();
  }

  // TODO may be unite in one class
  MovieListData _makeListData(Movie movie) {
    final releaseDate = movie.releaseDate;
    final releaseDateTitle = releaseDate != null ? _dateFormat.format(releaseDate) : '';
    return MovieListData(
      title: movie.title,
      posterPath: movie.posterPath,
      backdropPath: movie.backdropPath,
      id: movie.id,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      releaseDate: releaseDateTitle,
    );
  }

  void showedNowPlayingMovieAtIndex(int index) {
    if (index < state.movies.length - 1) return;
    nowPlayingMovieListBloc.add(MovieListEventLoadNextPage(state.localeTag));
  }

  void searchNowPlayingMovie(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(
      const Duration(milliseconds: 300),
        () async {
        nowPlayingMovieListBloc.add(MovieListEventSearchMovie(text));
        nowPlayingMovieListBloc.add(MovieListEventLoadNextPage(state.localeTag));
        }
    );
  }

/*  void onMovieTap(BuildContext context, int index) {
      final id = movie[index].id;
      Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }*/
}