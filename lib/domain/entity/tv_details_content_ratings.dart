import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_details_content_ratings.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsContentRatings {
  @JsonKey(name: 'results')
  final int id;
  final List<TvDetailsContentRatingsList> ratingsList;

  const TvDetailsContentRatings({
    required this.id,
    required this.ratingsList,
  });

  factory TvDetailsContentRatings.fromJson(Map<String, dynamic> json) => _$TvDetailsContentRatingsFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsContentRatingsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsContentRatingsList {
  final List descriptors;
  @JsonKey(name: 'iso_3166_1')
  final String iso;
  final String rating;

  const TvDetailsContentRatingsList({
    required this.descriptors,
    required this.iso,
    required this.rating,
  });

  factory TvDetailsContentRatingsList.fromJson(Map<String, dynamic> json) => _$TvDetailsContentRatingsListFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsContentRatingsListToJson(this);
}

