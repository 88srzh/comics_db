// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episodes_credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvEpisodesCredits _$TvEpisodesCreditsFromJson(Map<String, dynamic> json) =>
    TvEpisodesCredits(
      id: json['id'] as int,
      cast: (json['cast'] as List<dynamic>)
          .map((e) => TvEpisodesActor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvEpisodesCreditsToJson(TvEpisodesCredits instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast.map((e) => e.toJson()).toList(),
    };

TvEpisodesActor _$TvEpisodesActorFromJson(Map<String, dynamic> json) =>
    TvEpisodesActor(
      adult: json['adult'] as bool,
      gender: json['gender'] as int,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      order: json['order'] as int,
    );

Map<String, dynamic> _$TvEpisodesActorToJson(TvEpisodesActor instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
    };
