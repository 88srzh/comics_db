// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TVImpl _$$TVImplFromJson(Map<String, dynamic> json) => _$TVImpl(
      posterPath: json['poster_path'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      id: json['id'] as int,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String,
      firstAirDate: parseDateFromString(json['first_air_date'] as String?),
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      originalLanguage: json['original_language'] as String,
      voteCount: (json['vote_count'] as num).toDouble(),
      name: json['name'] as String,
      originalName: json['original_name'] as String,
    );

Map<String, dynamic> _$$TVImplToJson(_$TVImpl instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'origin_country': instance.originCountry,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'name': instance.name,
      'original_name': instance.originalName,
    };
