// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetails _$AccountDetailsFromJson(Map<String, dynamic> json) =>
    AccountDetails(
      id: json['id'] as int,
      iso6391: json['iso_639_1'] as String,
      iso31661: json['iso_3166_1'] as String,
      name: json['name'] as String,
      includeAdult: json['include_adult'] as bool,
      username: json['username'] as String,
      avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountDetailsToJson(AccountDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'include_adult': instance.includeAdult,
      'username': instance.username,
      'avatar': instance.avatar.toJson(),
    };
