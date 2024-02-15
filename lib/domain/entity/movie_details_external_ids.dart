
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_external_ids.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsExternalIDs {
  final String? imdbId;
  final String? wikidataId;
  final String? facebookId;
  final String? instagramId;
  final String? twitterId;

  MovieDetailsExternalIDs({
    this.imdbId,
    this.wikidataId,
    this.facebookId,
    this.instagramId,
    this.twitterId,
  });

  factory MovieDetailsExternalIDs.fromJson(Map<String, dynamic> json) => _$MovieDetailsExternalIDsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsExternalIDsToJson(this);
}