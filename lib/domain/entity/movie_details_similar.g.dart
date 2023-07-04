// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_similar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsSimilar _$MovieDetailsSimilarFromJson(Map<String, dynamic> json) =>
    MovieDetailsSimilar(
      similar: (json['results'] as List<dynamic>)
          .map((e) =>
              MovieDetailsSimilarResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailsSimilarToJson(
        MovieDetailsSimilar instance) =>
    <String, dynamic>{
      'results': instance.similar.map((e) => e.toJson()).toList(),
    };

MovieDetailsSimilarResult _$MovieDetailsSimilarResultFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsSimilarResult(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$MovieDetailsSimilarResultToJson(
        MovieDetailsSimilarResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
    };
