import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_details_recommendations.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsRecommendations {
  final int page;
  @JsonKey(name: 'results')
  final List<TvDetailsRecommendationsList> recommendationsList;

  const TvDetailsRecommendations({
    required this.page,
    required this.recommendationsList,
  });

  factory TvDetailsRecommendations.fromJson(Map<String, dynamic> json) => _$TvDetailsRecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsRecommendationsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsRecommendationsList {
  final int id;
  final String? posterPath;
  final String? backdropPath;
  final String name;

  const TvDetailsRecommendationsList({
    required this.id,
    this.posterPath,
    this.backdropPath,
    required this.name,
  });

  factory TvDetailsRecommendationsList.fromJson(Map<String, dynamic> json) => _$TvDetailsRecommendationsListFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsRecommendationsListToJson(this);
}