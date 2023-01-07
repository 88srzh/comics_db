// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/movie.dart';

part 'movie_similar.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieSimilar {
  final int page;
  @JsonKey(name: 'results')
  List<Movie> movies;
  final int totalResults;
  final int totalPages;

  MovieSimilar({
    required this.page,
    required this.movies,
    required this.totalResults,
    required this.totalPages,
  });

  factory MovieSimilar.fromJson(Map<String, dynamic> json) =>
      _$MovieSimilarFromJson(json);

  Map<String, dynamic> toJson() => _$MovieSimilarToJson(this);
}
