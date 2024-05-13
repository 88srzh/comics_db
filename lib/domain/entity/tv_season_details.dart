import 'package:comics_db_app/domain/entity/data_parser.dart';
import 'package:comics_db_app/domain/entity/tv_season_details_crew.dart';
import 'package:comics_db_app/domain/entity/tv_season_details_guest_stars.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_season_details.freezed.dart';

part 'tv_season_details.g.dart';

@freezed
class TvSeasonDetails with _$TvSeasonDetails {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  factory TvSeasonDetails({
    @JsonKey(fromJson: parseDateFromString) required DateTime? airDate,
    required int episodeNumber,
    required String episodeType,
    required int id,
    required String name,
    required String overview,
    required String productionCode,
    required int runtime,
    required int seasonNumber,
    required int showId,
    String? stillPath,
    required double voteAverage,
    required int voteCount,
    required List<TvSeasonDetailsCrew> crew,
    required List<TvSeasonDetailsGuestStars> guestStars,
}) = _TvSeasonDetails;

  factory TvSeasonDetails.fromJson(Map<String, dynamic> json) => _$TvSeasonDetailsFromJson(json);
}