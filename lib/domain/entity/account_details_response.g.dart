// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDetailsResponse _$$_AccountDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AccountDetailsResponse(
      id: json['id'] as int,
      iso6391: json['iso_693_1'] as String,
      iso31661: json['iso_3166_1'] as String,
      name: json['name'] as String,
      includeAdult: json['include_adult'] as bool,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$_AccountDetailsResponseToJson(
        _$_AccountDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iso_693_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'include_adult': instance.includeAdult,
      'username': instance.username,
    };
