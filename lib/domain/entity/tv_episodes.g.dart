// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episodes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeasonEpisodes _$TvSeasonEpisodesFromJson(Map<String, dynamic> json) =>
    TvSeasonEpisodes(
      airDate: DateTime.parse(json['air_date'] as String),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => TvEpisodesCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeNumber: json['episode_number'] as int,
      episodeType: json['episode_type'] as String,
      name: json['name'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      productionCode: json['production_code'] as String,
      runtime: json['runtime'] as int,
      showId: json['show_id'] as int,
      seasonNumber: json['season_number'] as int,
      stillPath: json['still_path'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$TvSeasonEpisodesToJson(TvSeasonEpisodes instance) =>
    <String, dynamic>{
      'air_date': instance.airDate.toIso8601String(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
      'episode_number': instance.episodeNumber,
      'episode_type': instance.episodeType,
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'show_id': instance.showId,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
