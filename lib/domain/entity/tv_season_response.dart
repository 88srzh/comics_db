import 'package:comics_db_app/domain/entity/tv_seasons.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_season_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvSeasonResponse {
  final int page;
  @JsonKey(name: 'episodes')
  List<TvSeasons> seasons;
  final String airDate;
  final String name;
  final String overview;
  final int id;
  final String posterPath;
  final int seasonNumber;
  final double voteAverage;

  TvSeasonResponse({
    required this.page,
    required this.seasons,
    required this.airDate,
    required this.name,
    required this.overview,
    required this.id,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory TvSeasonResponse.fromJson(Map<String, dynamic> json) => _$TvSeasonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeasonResponseToJson(this);
}
