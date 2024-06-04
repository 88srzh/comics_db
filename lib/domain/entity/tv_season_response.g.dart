// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeasonResponse _$TvSeasonResponseFromJson(Map<String, dynamic> json) =>
    TvSeasonResponse(
      seasonDetails: (json['episodes'] as List<dynamic>)
          .map((e) => TvSeasonDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      airDate: json['air_date'] as String,
      name: json['name'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      posterPath: json['poster_path'] as String,
      seasonNumber: json['season_number'] as int,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$TvSeasonResponseToJson(TvSeasonResponse instance) =>
    <String, dynamic>{
      'episodes': instance.seasonDetails.map((e) => e.toJson()).toList(),
      'air_date': instance.airDate,
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
      'vote_average': instance.voteAverage,
    };
