// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season_details_guest_stars.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvSeasonDetailsGuestStarsImpl _$$TvSeasonDetailsGuestStarsImplFromJson(
        Map<String, dynamic> json) =>
    _$TvSeasonDetailsGuestStarsImpl(
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      order: json['order'] as int,
      adult: json['adult'] as bool,
      gender: json['gender'] as int,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$TvSeasonDetailsGuestStarsImplToJson(
        _$TvSeasonDetailsGuestStarsImpl instance) =>
    <String, dynamic>{
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'profile_path': instance.profilePath,
    };
