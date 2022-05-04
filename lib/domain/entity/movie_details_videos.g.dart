// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsVideos _$MovieDetailsVideosFromJson(Map<String, dynamic> json) =>
    MovieDetailsVideos(
      results: (json['results'] as List<dynamic>)
          .map((e) =>
              MovieDetailsVideosResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailsVideosToJson(MovieDetailsVideos instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

MovieDetailsVideosResult _$MovieDetailsVideosResultFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsVideosResult(
      iso6391: json['iso_639_1'] as String,
      iso31661: json['iso_3166_1'] as String,
      name: json['name'] as String,
      key: json['key'] as String,
      site: json['site'] as String,
      size: json['size'] as int,
      type: json['type'] as String,
      official: json['official'] as bool,
      publishedAt: json['published_at'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$MovieDetailsVideosResultToJson(
        MovieDetailsVideosResult instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
      'id': instance.id,
    };
