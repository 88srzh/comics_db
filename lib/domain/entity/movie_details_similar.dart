// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'movie_details_similar.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsSimilar {
  // final int page;
  @JsonKey(name: 'results')
  List<MovieDetailsSimilarResult> similar;

  MovieDetailsSimilar({
    // required this.page,
    required this.similar,
  });

  factory MovieDetailsSimilar.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsSimilarFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsSimilarToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsSimilarResult {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final List<int> genreIds;

  const MovieDetailsSimilarResult({
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
    required this.genreIds
  });

  factory MovieDetailsSimilarResult.fromJson(Map<String, dynamic> json) => _$MovieDetailsSimilarResultFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsSimilarResultToJson(this);
}
