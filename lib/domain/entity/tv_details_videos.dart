import 'package:json_annotation/json_annotation.dart';

part 'tv_details_videos.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsVideos {
  final List<TVDetailsVideosResults> results;

  TvDetailsVideos({
    required this.results
  });

  factory TvDetailsVideos.fromJson(Map<String, dynamic> json) => _$TvDetailsVideosFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsVideosToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TVDetailsVideosResults {
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final num size;
  final String type;
  final bool official;
  final int publishedAt;
  final String id;

  TVDetailsVideosResults({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id
  });

  factory TVDetailsVideosResults.fromJson(Map<String, dynamic> json) => _$TVDetailsVideosResultsFromJson(json);

  Map<String, dynamic> toJson() => _$TVDetailsVideosResultsToJson(this);
}

