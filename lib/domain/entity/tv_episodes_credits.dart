import 'package:json_annotation/json_annotation.dart';

part 'tv_episodes_credits.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvEpisodesCredits {
  final int id;
  List<TvEpisodesActor> cast;

  TvEpisodesCredits({
    required this.id,
    required this.cast,
  });

  factory TvEpisodesCredits.fromJson(Map<String, dynamic> json) => _$TvEpisodesCreditsFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodesCreditsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvEpisodesActor {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String character;
  final String creditId;
  final int order;

  const TvEpisodesActor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory TvEpisodesActor.fromJson(Map<String, dynamic> json) => _$TvEpisodesActorFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodesActorToJson(this);
}
