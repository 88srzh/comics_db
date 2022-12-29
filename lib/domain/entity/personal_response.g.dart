// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PersonalResponse _$$_PersonalResponseFromJson(Map<String, dynamic> json) =>
    _$_PersonalResponse(
      id: json['id'] as int,
      iso6391: json['iso_693_1'] as String,
      iso31661: json['iso_3166_1'] as String,
      name: json['name'] as String,
      includeAdult: json['include_adult'] as bool,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$_PersonalResponseToJson(_$_PersonalResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iso_693_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'include_adult': instance.includeAdult,
      'username': instance.username,
    };
