import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_season_details_guest_stars.freezed.dart';

part 'tv_season_details_guest_stars.g.dart';

@freezed
class TvSeasonDetailsGuestStars with _$TvSeasonDetailsGuestStars {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  factory TvSeasonDetailsGuestStars ({
    required String character,
    required String creditId,
    required int order,
    required bool adult,
    required int gender,
    required int id,
    required String knownForDepartment,
    required String name,
    required String originalName,
    required String? profilePath,
}) = _TvSeasonDetailsGuestStars;

  factory TvSeasonDetailsGuestStars.fromJson(Map<String, dynamic> json) => _$TvSeasonDetailsGuestStarsFromJson(json);
}