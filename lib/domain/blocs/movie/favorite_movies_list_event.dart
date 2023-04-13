part of 'favorite_movies_list_bloc.dart';

@freezed
class FavoriteMoviesListEvent with _$FavoriteMoviesListEvent {
  const factory FavoriteMoviesListEvent.loadFavoriteMoviesTotalResults({required String locale}) = FavoriteMoviesListEventLoadFavoriteMoviesTotalResults;

  // const factory FavoriteMovieListEvent.reset() = FavoriteMovieListEventLoadReset;

  // const factory FavoriteMovieListEvent.search({required String query}) = FavoriteMovieListEventSearchMovie;
}
