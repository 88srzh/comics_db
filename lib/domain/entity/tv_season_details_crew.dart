import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_season_details_crew.freezed.dart';

part 'tv_season_details_crew.g.dart';

@freezed
class TvSeasonDetailsCrew with _$TvSeasonDetailsCrew {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  factory TvSeasonDetailsCrew({
    required String department,
    required String job,
    required String creditId,
    required bool adult,
    required int gender,
    required int id,
    required String knownForDepartment,
    required String name,
    required String originalName,
    required double popularity,
    required String profilePath,
}) = _TvSeasonDetailsCrew;

  factory TvSeasonDetailsCrew.fromJson(Map<String, dynamic> json) => _$TvSeasonDetailsCrewFromJson(json);
}

