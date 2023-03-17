part of 'movie_popular_list_bloc.dart';

// @freezed
// class MovieListEvent with _$MovieListEvent {
//   const factory MovieListEvent.loadNextPage({required String locale}) = MovieListEventLoadNextPage;
//
//   const factory MovieListEvent.reset() = MovieListEventLoadReset;
//
//   const factory MovieListEvent.search({required String query}) = MovieListEventSearchMovie;
//
//   const factory MovieListEvent.addFavorite() = MovieListEventFaforiteItemEvent;
// }

abstract class MovieListEvent extends Equatable {
  final Movie movie;
  final String query;
  final String locale;

  const MovieListEvent(this.movie, this.query, this.locale);

  @override
  List<Object?> get props => [movie, query, locale];
}

class LoadNextPageEvent extends MovieListEvent {
  const LoadNextPageEvent(Movie movie, String query, String locale) : super(movie, query, locale);
}

class ResetEvent extends MovieListEvent {
  const ResetEvent(Movie movie, String query, String locale) : super(movie, query, locale);
}

class SearchEvent extends MovieListEvent {
  const SearchEvent(Movie movie, String query, String locale) : super(movie, query, locale);
}

class FavoriteItemEvent extends MovieListEvent {
  const FavoriteItemEvent(Movie movie, String query, String locale) : super(movie, query, locale);
}
