import 'package:json_annotation/json_annotation.dart';

part 'movie_details_recommendations.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsRecommendations {
  final int page;
  @JsonKey(name: 'results')
  final List<MovieDetailsRecommendationsList> recommendationsList;

  const MovieDetailsRecommendations({
    required this.page,
    required this.recommendationsList,
  });

  factory MovieDetailsRecommendations.fromJson(Map<String, dynamic> json) => _$MovieDetailsRecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsRecommendationsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsRecommendationsList {
  final int id;
  final String? posterPath;
  final String? backdropPath;
  final String title;

  const MovieDetailsRecommendationsList({
    required this.id,
    this.posterPath,
    this.backdropPath,
    required this.title,
  });

  factory MovieDetailsRecommendationsList.fromJson(Map<String, dynamic> json) => _$MovieDetailsRecommendationsListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsRecommendationsListToJson(this);

}