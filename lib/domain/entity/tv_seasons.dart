import 'package:comics_db_app/domain/entity/data_parser.dart';
import 'package:comics_db_app/domain/entity/tv_season_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_seasons.freezed.dart';

part 'tv_seasons.g.dart';

@freezed
class TvSeasons with _$TvSeasons {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  factory TvSeasons({
    @JsonKey(fromJson: parseDateFromString) required DateTime? airDate,
    required List<TvSeasonDetails> episodes,
    required String name,
    required String overview,
    required int id,
    required String posterPath,
    required int seasonNumber,
    required double voteAverage,
  }) = _TvSeasons;

  factory TvSeasons.fromJson(Map<String, dynamic> json) => _$TvSeasonsFromJson(json);

}