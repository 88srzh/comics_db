import 'package:json_annotation/json_annotation.dart';

part 'movie_details_recommendations.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsRecommendations {
  final int page;
  @JsonKey(name: 'results')
  final List<MovieDetailsRecommendationsResults> recommendationsResults;

  const MovieDetailsRecommendations({
    required this.page,
    required this.recommendationsResults,
  });

  factory MovieDetailsRecommendations.fromJson(Map<String, dynamic> json) => _$MovieDetailsRecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsRecommendationsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsRecommendationsResults {
  final int id;
  final String? posterPath;
  final String? backdropPath;
  final String title;

  const MovieDetailsRecommendationsResults({
    required this.id,
    this.posterPath,
    this.backdropPath,
    required this.title,
  });

  factory MovieDetailsRecommendationsResults.fromJson(Map<String, dynamic> json) => _$MovieDetailsRecommendationsResultsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsRecommendationsResultsToJson(this);

}