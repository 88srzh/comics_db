// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_external_ids.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsExternalIDs _$MovieDetailsExternalIDsFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsExternalIDs(
      imdbId: json['imdb_id'] as String?,
      wikidataId: json['wikidata_id'] as String?,
      facebookId: json['facebook_id'] as String?,
      instagramId: json['instagram_id'] as String?,
      twitterId: json['twitter_id'] as String?,
    );

Map<String, dynamic> _$MovieDetailsExternalIDsToJson(
        MovieDetailsExternalIDs instance) =>
    <String, dynamic>{
      'imdb_id': instance.imdbId,
      'wikidata_id': instance.wikidataId,
      'facebook_id': instance.facebookId,
      'instagram_id': instance.instagramId,
      'twitter_id': instance.twitterId,
    };
