import 'package:json_annotation/json_annotation.dart';

part 'tv_episodes_crew.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvEpisodesCrew {
  final String job;
  final String department;
  final String creditId;
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  const TvEpisodesCrew({
    required this.job,
    required this.department,
    required this.creditId,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });

  factory TvEpisodesCrew.fromJson(Map<String, dynamic> json) => _$TvEpisodesCrewFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodesCrewToJson(this);
}