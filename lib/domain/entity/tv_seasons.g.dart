// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_seasons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvSeasonsImpl _$$TvSeasonsImplFromJson(Map<String, dynamic> json) =>
    _$TvSeasonsImpl(
      airDate: parseDateFromString(json['air_date'] as String?),
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => TvSeasonDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      posterPath: json['poster_path'] as String,
      seasonNumber: json['season_number'] as int,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$$TvSeasonsImplToJson(_$TvSeasonsImpl instance) =>
    <String, dynamic>{
      'air_date': instance.airDate?.toIso8601String(),
      'episodes': instance.episodes.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
      'vote_average': instance.voteAverage,
    };
