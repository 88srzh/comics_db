import 'package:json_annotation/json_annotation.dart';

part 'tv_episodes_guest_stars.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvEpisodesGuestStars {
  final String character;
  final String creditId;
  final int order;
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? posterPath;

  const TvEpisodesGuestStars({
    required this.character,
    required this.creditId,
    required this.order,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.posterPath,
  });

  factory TvEpisodesGuestStars.fromJson(Map<String, dynamic> json) => _$TvEpisodesGuestStarsFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodesGuestStarsToJson(this);
}