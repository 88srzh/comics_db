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

  const MovieListEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

class LoadNextPageEvent extends MovieListEvent {
  const LoadNextPageEvent(Movie movie, String locale) : super(movie);
}

class ResetEvent extends MovieListEvent {
  const ResetEvent(Movie movie) : super(movie);
}

class SearchEvent extends MovieListEvent {
  const SearchEvent(Movie movie, String query) : super(movie);
}

class FavoriteItemEvent extends MovieListEvent {
  const FavoriteItemEvent(Movie movie) : super(movie);
}
