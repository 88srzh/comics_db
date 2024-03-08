// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      gravatar: Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
      tmdb: Tmdb.fromJson(json['tmdb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'gravatar': instance.gravatar.toJson(),
      'tmdb': instance.tmdb.toJson(),
    };

Gravatar _$GravatarFromJson(Map<String, dynamic> json) => Gravatar(
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$GravatarToJson(Gravatar instance) => <String, dynamic>{
      'hash': instance.hash,
    };

Tmdb _$TmdbFromJson(Map<String, dynamic> json) => Tmdb(
      avatarPath: json['avatar_path'] as String?,
    );

Map<String, dynamic> _$TmdbToJson(Tmdb instance) => <String, dynamic>{
      'avatar_path': instance.avatarPath,
    };
