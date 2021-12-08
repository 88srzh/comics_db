import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_and_top_rated_movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PopularAndTopRatedMovieResponse {
  final int page;
  @JsonKey(name: 'results')
  List<Movie> movies;
  final int totalResults;
  final int totalPages;

  PopularAndTopRatedMovieResponse({
    required this.page,
    required this.movies,
    required this.totalResults,
    required this.totalPages,
  });

  factory PopularAndTopRatedMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularAndTopRatedMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularAndTopRatedMovieResponseToJson(this);
}
