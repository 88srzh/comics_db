import 'package:json_annotation/json_annotation.dart';

part 'movie_details_recommendations.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsRecommendations {
  final List<MovieDetailsRecommendationsList> recommendationsList;

  const MovieDetailsRecommendations({
    required this.recommendationsList,
  });

  factory MovieDetailsRecommendations.fromJson(Map<String, dynamic> json) => _$MovieDetailsRecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsRecommendationsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsRecommendationsList {
  final int id;
  final String? posterPath;
  final String title;

  const MovieDetailsRecommendationsList({
    required this.id,
    this.posterPath,
    required this.title,
  });

  factory MovieDetailsRecommendationsList.fromJson(Map<String, dynamic> json) => _$MovieDetailsRecommendationsListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsRecommendationsListToJson(this);

}