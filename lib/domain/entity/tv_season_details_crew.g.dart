// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season_details_crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvSeasonDetailsCrewImpl _$$TvSeasonDetailsCrewImplFromJson(
        Map<String, dynamic> json) =>
    _$TvSeasonDetailsCrewImpl(
      department: json['department'] as String,
      job: json['job'] as String,
      creditId: json['credit_id'] as String,
      adult: json['adult'] as bool,
      gender: json['gender'] as int,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$TvSeasonDetailsCrewImplToJson(
        _$TvSeasonDetailsCrewImpl instance) =>
    <String, dynamic>{
      'department': instance.department,
      'job': instance.job,
      'credit_id': instance.creditId,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
