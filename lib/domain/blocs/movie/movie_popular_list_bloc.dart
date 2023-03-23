// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/core/app_extension.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_container.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'movie_popular_list_bloc.freezed.dart';

part 'movie_list_event.dart';

part 'movie_list_state.dart';

class MoviePopularListBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieAndTvApiClient();
  late DateFormat _dateFormat;
  Timer? searchDebounce;
  var mov = <Movie>[];

  MoviePopularListBloc(MovieListState initialState) : super(initialState) {
    on<MovieListEvent>(((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onMovieListEventLoadNextPage(event, emit);
      } else if (event is MovieListEventLoadReset) {
        await onMovieListEventLoadReset(event, emit);
      } else if (event is MovieListEventSearchMovie) {
        await onMovieListEventLoadSearchMovie(event, emit);
      } else if (event is MovieListEventFaforiteItemEvent) {
        onMovieListFavoriteEvent(event, emit);
      }
    }), transformer: sequential());
    // on<LoadNextPageEvent>(onMovieListEventLoadNextPage);
    // on<ResetEvent>(onMovieListEventLoadReset);
    // on<SearchEvent>(onMovieListEventLoadSearchMovie);
    // on<FavoriteItemEvent>(onMovieListFavoriteEvent);
  }

  void _onState(MovieListState state, Emitter<MovieListState> emit) {
    final movies = state.movies.map(_makeListData).toList();
    final newState = this.state.copyWith(movies: movies);
    emit(newState);
  }

  void setupPopularMovieLocale(String localeTag, Emitter<MovieListState> emit) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    add(const MovieListEventLoadReset());
    add(MovieListEventLoadNextPage(locale: localeTag));
  }

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

  void showedPopularMovieAtIndex(int index) {
    if (index < state.movies.length - 1) return;
    add(MovieListEventLoadNextPage(locale: state.localeTag));
  }

  void searchPopularMovie(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(
      const Duration(milliseconds: 300),
          () async {
        add(MovieListEventSearchMovie(query: text));
        add(MovieListEventLoadNextPage(locale: state.localeTag));
      },
    );
  }

  void onMovieTap(BuildContext context, int index) {
    final id = state.movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  Future<void> onMovieListEventLoadNextPage(MovieListEventLoadNextPage event, Emitter<MovieListState> emit) async {
    if (state.isSearchMode) {
      final container = await loadNextPage(
        state.searchMovieContainer,
        (nextPage) async {
          final result =
              await _movieApiClient.searchMovie(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
          return result;
        },
      );
      if (container != null) {
        final newState = state.copyWith(searchMovieContainer: container);
        emit(newState);
      }
    } else {
      final container = await loadNextPage(state.movieContainer, (nextPage) async {
        final result = await _movieApiClient.popularMovie(nextPage, event.locale, Configuration.apiKey);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(movieContainer: container);
        emit(newState);
      }
    }
  }

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

  Future<void> onMovieListEventLoadReset(MovieListEventLoadReset event, Emitter<MovieListState> emit) async {
    emit(const MovieListState.initial());
    // TODO should fix locale
    add(const MovieListEventLoadNextPage(locale: ''));
  }

  Future<void> onMovieListEventLoadSearchMovie(MovieListEventSearchMovie event, Emitter<MovieListState> emit) async {
    if (state.searchQuery == event.query) return;
    final newState = state.copyWith(searchQuery: event.query, searchMovieContainer: const MovieListContainer.initial());
    emit(newState);
  }

  void onMovieListFavoriteEvent(MovieListEventFaforiteItemEvent event, Emitter<MovieListState> emit) {
    int index = state.movieContainer.movies.getIndex(event.movie);
    final List<Movie> movies = state.movies.map((element) {
      if (element.id == event.movie.id) {
        return event.movie.copyWith(isFavorite: !state.movieContainer.movies[index].isFavorite);
      }
      return element;
    }).toList();
    emit(
      MovieListState(
        movieContainer: state.movieContainer,
        searchMovieContainer: state.searchMovieContainer,
        searchQuery: state.searchQuery,
        movies: movies,
        localeTag: state.localeTag,
      ),
    );
  }
}
