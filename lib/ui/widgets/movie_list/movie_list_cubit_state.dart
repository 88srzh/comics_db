// Project imports:
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';

class MovieListCubitState {
  final List<MovieListData> movies;
  final String localeTag;

  MovieListCubitState({required this.movies, required this.localeTag});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieListCubitState &&
          runtimeType == other.runtimeType &&
          movies == other.movies &&
          localeTag == other.localeTag;

  @override
  int get hashCode => movies.hashCode ^ localeTag.hashCode;

  MovieListCubitState copyWith({
    List<MovieListData>? movies,
    String? localeTag,
  }) {
    return MovieListCubitState(
      movies: movies ?? this.movies,
      localeTag: localeTag ?? this.localeTag,
    );
  }
}
