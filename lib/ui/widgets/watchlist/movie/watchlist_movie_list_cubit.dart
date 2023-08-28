// Dart imports:
import 'dart:async';

// Package imports:
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/movie/watchlist_movie_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';

class WatchlistMovieCubit extends Cubit<MovieListCubitState> {
  final WatchlistMovieBloc watchlistBloc;
  late final StreamSubscription<MovieListState> watchlistBlocSubscription;
  var movie = <Movie>[];
  late DateFormat _dateFormat;

  WatchlistMovieCubit({required this.watchlistBloc}) : super(MovieListCubitState(movies: const <MovieListData>[], localeTag: '', totalResults: 0)) {
    Future.microtask(
      () {
        _onState(watchlistBloc.state);
        watchlistBlocSubscription = watchlistBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(MovieListState state) {
    final movies = state.movies.map(_makeListData).toList();
    final newState = this.state.copyWith(movies: movies);
    emit(newState);
  }

  // void _onStateTV(WatchlistState state) {
  //   final tv = state.tvs.map(_makeTVsListData).toList();
  //   final newState = this.state.copyWith(watchlistList: tv);
  //   emit(newState);
  // }

  void setupWatchlistLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    watchlistBloc.add(const MovieListEventLoadReset());
    watchlistBloc.add(MovieListEventLoadNextPage(locale: localeTag));
  }

  @override
  Future<void> close() {
    watchlistBlocSubscription.cancel();
    return super.close();
  }

  void showedWatchlistMovieAtIndex(int index) {
    watchlistBloc.add(MovieListEventLoadNextPage(locale: state.localeTag));
  }

  void showedWatchlistMovies() {
    watchlistBloc.add(const MovieListEventLoadReset());
    watchlistBloc.add(MovieListEventLoadNextPage(locale: state.localeTag));
  }

  MovieListData _makeListData(Movie movie) {
    final releaseDate = movie.releaseDate;
    final releaseDateTitle = releaseDate != null ? _dateFormat.format(releaseDate) : '';
    return MovieListData(
      id: movie.id,
      posterPath: movie.posterPath,
      backdropPath: movie.backdropPath,
      overview: movie.overview,
      originalTitle: movie.originalTitle,
      title: movie.title,
      releaseDate: releaseDateTitle,
    );
  }

// TODO add onTap to movie and tv
}
