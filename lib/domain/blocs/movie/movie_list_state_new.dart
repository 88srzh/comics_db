import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part of 'movie_popular_list_bloc.dart';

@immutable
class NewMovieListState extends Equatable {
  final List<Movie> movies;
  final String searchQuery;

  const NewMovieListState({required this.movies, required this.searchQuery});

  const NewMovieListState.initial(List<Movie> movies) : this(movies: movies, searchQuery: searchQuery.isEmpty);

  @override
  List<Object?> get props => [movies];

  NewMovieListState copyWith({
    List<Movie>? movies,
  }) {
    return NewMovieListState(
      movies: movies ?? this.movies,
    );
  }

  @override
  String toString() {
    return 'NewMovieListState{movies: $movies}';
  }
}