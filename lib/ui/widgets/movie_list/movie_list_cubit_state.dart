// Project imports:
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';

class MovieListCubitState {
  final List<MovieListData> movies;
  final String localeTag;
  final int totalResults;

  MovieListCubitState({required this.movies, required this.localeTag, required this.totalResults});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieListCubitState &&
          runtimeType == other.runtimeType &&
          movies == other.movies &&
          localeTag == other.localeTag &&
          totalResults == other.totalResults;

  @override
  int get hashCode => movies.hashCode ^ localeTag.hashCode ^ totalResults.hashCode;

  MovieListCubitState copyWith({
    List<MovieListData>? movies,
    String? localeTag,
    int? totalResults,
  }) {
    return MovieListCubitState(
      movies: movies ?? this.movies,
      localeTag: localeTag ?? this.localeTag,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
