import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_external_ids.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsExternalIds {
  final List<MovieDetailsExternalIdsResults> results;

  const MovieDetailsExternalIds({
    required this.results,
  });

  factory MovieDetailsExternalIds.fromJson(Map<String, dynamic> json) => _$MovieDetailsExternalIdsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsExternalIdsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsExternalIdsResults {
  final int id;
  final String? imdbId;
  final String? facebookId;
  final String? instagramId;
  final String? twitterId;
  final String? wikidataId;

  const MovieDetailsExternalIdsResults({
    required this.id,
    this.imdbId,
    this.facebookId,
    this.instagramId,
    this.twitterId,
    this.wikidataId,
  });

  factory MovieDetailsExternalIdsResults.fromJson(Map<String, dynamic> json) => _$MovieDetailsExternalIdsResultsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsExternalIdsResultsToJson(this);
}
