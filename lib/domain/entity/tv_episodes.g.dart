// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episodes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvEpisodes _$TvEpisodesFromJson(Map<String, dynamic> json) => TvEpisodes(
      airDate: DateTime.parse(json['air_date'] as String),
      credits:
          TvEpisodesCredits.fromJson(json['credits'] as Map<String, dynamic>),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => TvEpisodesCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeNumber: json['episode_number'] as int,
      guestStars: TvEpisodesGuestStars.fromJson(
          json['guest_stars'] as Map<String, dynamic>),
      name: json['name'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      productionCode: json['production_code'] as String,
      runtime: json['runtime'] as int,
      seasonNumber: json['season_number'] as int,
      stillPath: json['still_path'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$TvEpisodesToJson(TvEpisodes instance) =>
    <String, dynamic>{
      'air_date': instance.airDate.toIso8601String(),
      'credits': instance.credits.toJson(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
      'episode_number': instance.episodeNumber,
      'guest_stars': instance.guestStars.toJson(),
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
