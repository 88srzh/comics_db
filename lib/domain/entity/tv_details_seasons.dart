// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/tv_episodes.dart';

part 'tv_details_seasons.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsSeasons {
  final DateTime airDate;
  final List<TvSeasonEpisodes> episodes;

  const TvDetailsSeasons({
    required this.airDate,
    required this.episodes,
  });

  factory TvDetailsSeasons.fromJson(Map<String, dynamic> json) => _$TvDetailsSeasonsFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsSeasonsToJson(this);
}
