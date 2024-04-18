import 'package:comics_db_app/domain/entity/tv_episodes_credits.dart';
import 'package:comics_db_app/domain/entity/tv_episodes_crew.dart';
import 'package:comics_db_app/domain/entity/tv_episodes_guest_stars.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_episodes.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvEpisodes {
  final DateTime airDate;
  final TvEpisodesCredits credits;
  final List<TvEpisodesCrew> crew;
  final int episodeNumber;
  final TvEpisodesGuestStars guestStars;
  final String name;
  final String overview;
  final int id;
  final String productionCode;
  final int runtime;
  final int seasonNumber;
  final String stillPath;
  final double voteAverage;
  final int voteCount;

  const TvEpisodes({
    required this.airDate,
    required this.credits,
    required this.crew,
    required this.episodeNumber,
    required this.guestStars,
    required this.name,
    required this.overview,
    required this.id,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvEpisodes.fromJson(Map<String, dynamic> json) => _$TvEpisodesFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodesToJson(this);
}