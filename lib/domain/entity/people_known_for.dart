import 'package:json_annotation/json_annotation.dart';

part 'people_known_for.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PeopleKnownFor {
  final List<PeopleKnownForResult> result;
  PeopleKnownFor({
    required this.result,
  });

  factory PeopleKnownFor.fromJson(Map<String, dynamic> json) => _$PeopleKnownForFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleKnownForToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PeopleKnownForResult {
  final String? posterPath;
  final bool adult;
  final String overview;
  final String releaseDate;
  final String originalTitle;
  final List<int> genreIds;
  final int id;
  final String mediaType;
  final String originalLanguage;
  final String title;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  PeopleKnownForResult({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.originalTitle,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  factory PeopleKnownForResult.fromJson(Map<String, dynamic> json) => _$PeopleKnownForResultFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleKnownForResultToJson(this);
}
