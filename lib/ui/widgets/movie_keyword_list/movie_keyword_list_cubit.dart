import 'dart:async';

import 'package:comics_db_app/domain/blocs/movie/movie_keywords_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MovieKeywordsListCubit extends Cubit<MovieListCubitState> {
  final MovieKeywordsListBloc movieKeywordsListBloc;
  late final StreamSubscription<MovieListState> movieKeywordsListBlocSubscription;
  late DateFormat _dateFormat;
  var movie = <Movie>[];
  final int keywordId;

  MovieKeywordsListCubit({required this.movieKeywordsListBloc,required this.keywordId}) : super(MovieListCubitState(movies: const <MovieListData>[], localeTag: '', totalResults: 0)) {
    Future.microtask(
      () {
        _onState(movieKeywordsListBloc.state);
        movieKeywordsListBlocSubscription = movieKeywordsListBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(MovieListState state) {
    final movies = state.movies.map(_makeListData).toList();
    final newState = this.state.copyWith(movies: movies);
    emit(newState);
  }

  void setupMovieKeywordLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    movieKeywordsListBloc.add(const MovieListEventLoadReset());
    movieKeywordsListBloc.add(MovieListEventLoadNextPage(locale: localeTag));
  }

  @override
  Future<void> close() {
    movieKeywordsListBlocSubscription.cancel();
    return super.close();
  }

  // TODO add to separate file
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

  void showedMovieKeywordMovieAtIndex(int index) {
    if (index < state.movies.length - 1) return;
    movieKeywordsListBloc.add(MovieListEventLoadNextPage(locale: state.localeTag));
  }

  void onMovieTap(BuildContext context, int index) {
    final id = movie[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }
}
