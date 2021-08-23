// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TV _$TVFromJson(Map<String, dynamic> json) {
  return TV(
    id: json['id'] as int,
    posterPath: json['poster_path'] as String?,
    gender: json['gender'] as String,
    languages:
        (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
    backdropPath: json['backdrop_path'] as String?,
    episodeRunTime: (json['episode_run_time'] as List<dynamic>)
        .map((e) => e as int)
        .toList(),
    firstAirDate: json['first_air_date'] as String,
    genreIds:
        (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
    originalLanguage: json['original_language'] as String,
    popularity: (json['popularity'] as num).toDouble(),
    seasonsIds:
        (json['seasons_ids'] as List<dynamic>).map((e) => e as int).toList(),
    voteAverage: (json['vote_average'] as num).toDouble(),
    voteCount: (json['vote_count'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TVToJson(TV instance) => <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
      'gender': instance.gender,
      'languages': instance.languages,
      'backdrop_path': instance.backdropPath,
      'episode_run_time': instance.episodeRunTime,
      'first_air_date': instance.firstAirDate,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'popularity': instance.popularity,
      'seasons_ids': instance.seasonsIds,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
