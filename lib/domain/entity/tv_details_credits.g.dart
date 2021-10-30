// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_details_credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvDetailsCredits _$TvDetailsCreditsFromJson(Map<String, dynamic> json) {
  return TvDetailsCredits(
    cast: (json['cast'] as List<dynamic>)
        .map((e) => TvActor.fromJson(e as Map<String, dynamic>))
        .toList(),
    crew: (json['crew'] as List<dynamic>)
        .map((e) => TvEmployee.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TvDetailsCreditsToJson(TvDetailsCredits instance) =>
    <String, dynamic>{
      'cast': instance.cast.map((e) => e.toJson()).toList(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
    };

TvActor _$TvActorFromJson(Map<String, dynamic> json) {
  return TvActor(
    adult: json['adult'] as bool,
    gender: json['gender'] as int?,
    id: json['id'] as int,
    knownForDepartment: json['known_for_department'] as String,
    name: json['name'] as String,
    originalName: json['original_name'] as String,
    popularity: json['popularity'] as int,
    profilePath: json['profile_path'] as String?,
    character: json['character'] as String,
    creditId: json['credit_id'] as String,
    order: json['order'] as int,
  );
}

Map<String, dynamic> _$TvActorToJson(TvActor instance) => <String, dynamic>{
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

TvEmployee _$TvEmployeeFromJson(Map<String, dynamic> json) {
  return TvEmployee(
    adult: json['adult'] as bool,
    gender: json['gender'] as int?,
    id: json['id'] as int,
    knownForDepartment: json['known_for_department'] as String,
    name: json['name'] as String,
    originalName: json['original_name'] as String,
    popularity: json['popularity'] as int,
    profilePath: json['profile_path'] as String?,
    creditId: json['credit_id'] as String,
    department: json['department'] as String,
    job: json['job'] as String,
  );
}

Map<String, dynamic> _$TvEmployeeToJson(TvEmployee instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'credit_id': instance.creditId,
      'department': instance.department,
      'job': instance.job,
    };
