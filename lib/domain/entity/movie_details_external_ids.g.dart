// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_external_ids.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsExternalIds _$MovieDetailsExternalIdsFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsExternalIds(
      id: json['id'] as int,
      imdbId: json['imdb_id'] as String?,
      facebookId: json['facebook_id'] as String?,
      instagramId: json['instagram_id'] as String?,
      twitterId: json['twitter_id'] as String?,
      wikidataId: json['wikidata_id'] as String?,
    );

Map<String, dynamic> _$MovieDetailsExternalIdsToJson(
        MovieDetailsExternalIds instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'facebook_id': instance.facebookId,
      'instagram_id': instance.instagramId,
      'twitter_id': instance.twitterId,
      'wikidata_id': instance.wikidataId,
    };
