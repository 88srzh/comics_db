import 'package:comics_db_app/components/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_movie_response.g.dart';

class PopularMovieResponse {
  final int page;
  @JsonKey(
    name: 'results',
  )
  final List<Movie> movies;
  final int totalResults;
  final int totalPages;

  PopularMovieResponse({
    required this.page,
    required this.movies,
    required this.totalResults,
    required this.totalPages,
  });

  factory PopularMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMovieResponseToJson(this);
}
