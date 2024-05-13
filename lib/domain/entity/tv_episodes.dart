// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/tv_episodes_crew.dart';

part 'tv_episodes.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvSeasonEpisodes {
  final DateTime airDate;
  final List<TvEpisodesCrew> crew;
  final int episodeNumber;
  final String episodeType;
  final String name;
  final String overview;
  final int id;
  final String productionCode;
  final int runtime;
  final int showId;
  final int seasonNumber;
  final String stillPath;
  final double voteAverage;
  final int voteCount;

  const TvSeasonEpisodes({
    required this.airDate,
    required this.crew,
    required this.episodeNumber,
    required this.episodeType,
    required this.name,
    required this.overview,
    required this.id,
    required this.productionCode,
    required this.runtime,
    required this.showId,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvSeasonEpisodes.fromJson(Map<String, dynamic> json) => _$TvSeasonEpisodesFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeasonEpisodesToJson(this);
}
