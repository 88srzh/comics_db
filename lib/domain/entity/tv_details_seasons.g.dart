// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_details_seasons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvDetailsSeasons _$TvDetailsSeasonsFromJson(Map<String, dynamic> json) =>
    TvDetailsSeasons(
      airDate: DateTime.parse(json['air_date'] as String),
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => TvSeasonEpisodes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvDetailsSeasonsToJson(TvDetailsSeasons instance) =>
    <String, dynamic>{
      'air_date': instance.airDate.toIso8601String(),
      'episodes': instance.episodes.map((e) => e.toJson()).toList(),
    };
