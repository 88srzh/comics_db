// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvSeasonDetailsImpl _$$TvSeasonDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$TvSeasonDetailsImpl(
      airDate: parseDateFromString(json['air_date'] as String?),
      episodeNumber: json['episode_number'] as int,
      episodeType: json['episode_type'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      productionCode: json['production_code'] as String,
      runtime: json['runtime'] as int,
      seasonNumber: json['season_number'] as int,
      showId: json['show_id'] as int,
      stillPath: json['still_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      crew: (json['crew'] as List<dynamic>)
          .map((e) => TvSeasonDetailsCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      guestStars: (json['guest_stars'] as List<dynamic>)
          .map((e) =>
              TvSeasonDetailsGuestStars.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TvSeasonDetailsImplToJson(
        _$TvSeasonDetailsImpl instance) =>
    <String, dynamic>{
      'air_date': instance.airDate?.toIso8601String(),
      'episode_number': instance.episodeNumber,
      'episode_type': instance.episodeType,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'crew': instance.crew.map((e) => e.toJson()).toList(),
      'guest_stars': instance.guestStars.map((e) => e.toJson()).toList(),
    };
