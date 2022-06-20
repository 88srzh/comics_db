import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/movie_list_bloc.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieListCubitState {
  final List<MovieListData> movies;
  final String localeTag;
  final String searchQuery;

  MovieListCubitState({required this.movies, required this.localeTag, required this.searchQuery});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieListCubitState &&
          runtimeType == other.runtimeType &&
          movies == other.movies &&
          localeTag == other.localeTag &&
          searchQuery == other.searchQuery;

  @override
  int get hashCode => movies.hashCode ^ localeTag.hashCode ^ searchQuery.hashCode;

  MovieListCubitState copyWith({
    List<MovieListData>? movies,
    String? localeTag,
    String? searchQuery,
  }) {
    return MovieListCubitState(
      movies: movies ?? this.movies,
      localeTag: localeTag ?? this.localeTag,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class MovieListCubit extends Cubit<MovieListCubitState> {
  final MovieListBloc movieListBloc;
  late final StreamSubscription<MovieListState> movieListBlocSubscription;
  late DateFormat _dateFormat;

  MovieListCubit({required MovieListCubitState initialState, required this.movieListBloc}) : super(initialState) {
    Future.microtask(
      () {
        _onState(movieListBloc.state);
        movieListBlocSubscription = movieListBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(MovieListState state) {
    if (state is AuthAuthorizedState) {
      emit(LoaderViewCubitState.authorized);
    } else if (state is AuthUnauthorizedState) {
      emit(LoaderViewCubitState.notAuthorized);
    }
  }

  Future<void> setupPopularMovieLocale(String localeTag) async {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
  }

  @override
  Future<void> close() {
    movieListBlocSubscription.cancel();
    return super.close();
  }
}
