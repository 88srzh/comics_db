// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TV _$TVFromJson(Map<String, dynamic> json) {
  return TV(
    id: json['id'] as int,
    posterPath: json['poster_path'] as String?,
    overview: json['overview'] as String,
    originCountry: (json['origin_country'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    backdropPath: json['backdrop_path'] as String?,
    firstAirDate: json['first_air_date'] as String,
    genreIds:
        (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
    originalLanguage: json['original_language'] as String,
    popularity: (json['popularity'] as num).toDouble(),
    voteAverage: (json['vote_average'] as num).toDouble(),
    voteCount: (json['vote_count'] as num).toDouble(),
    name: json['name'] as String,
    originalName: json['original_name'] as String,
  );
}

Map<String, dynamic> _$TVToJson(TV instance) => <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
      'origin_country': instance.originCountry,
      'backdrop_path': instance.backdropPath,
      'first_air_date': instance.firstAirDate,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'name': instance.name,
      'original_name': instance.originalName,
    };
