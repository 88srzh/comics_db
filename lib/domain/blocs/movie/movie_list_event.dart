part of 'movie_popular_list_bloc.dart';

@freezed
class MovieListEvent with _$MovieListEvent {
  const factory MovieListEvent.loadNextPage({required String locale}) = MovieListEventLoadNextPage;
  const factory MovieListEvent.reset() = MovieListEventLoadReset;
  const factory MovieListEvent.search({required String query}) = MovieListEventSearchMovie;
}



/*
abstract class MovieListEvent {}

class MovieListEventLoadNextPage extends MovieListEvent {
  final String locale;

  MovieListEventLoadNextPage(this.locale);
}

class MovieListEventLoadReset extends MovieListEvent {}

class MovieListEventSearchMovie extends MovieListEvent {
  final String query;

  MovieListEventSearchMovie(this.query);
}*/
