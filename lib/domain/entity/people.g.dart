// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) => People(
      profilePath: json['profile_path'] as String,
      adult: json['adult'] as bool,
      id: json['id'] as int,
      name: json['name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'id': instance.id,
      'name': instance.name,
      'popularity': instance.popularity,
    };
