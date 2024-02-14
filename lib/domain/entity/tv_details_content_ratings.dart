import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_details_content_ratings.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsContentRatings {
  @JsonKey(name: 'results')
  final List<TvDetailsContentRatingsResult> results;

  const TvDetailsContentRatings({
    required this.results,
  });

  factory TvDetailsContentRatings.fromJson(Map<String, dynamic> json) => _$TvDetailsContentRatingsFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsContentRatingsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsContentRatingsResult {
  final List? descriptors;
  @JsonKey(name: 'iso_3166_1')
  final String iso;
  final String rating;

  const TvDetailsContentRatingsResult({
    required this.descriptors,
    required this.iso,
    required this.rating,
  });

  factory TvDetailsContentRatingsResult.fromJson(Map<String, dynamic> json) => _$TvDetailsContentRatingsResultFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsContentRatingsResultToJson(this);
}

