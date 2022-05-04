// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_similar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSimilar _$MovieSimilarFromJson(Map<String, dynamic> json) => MovieSimilar(
      page: json['page'] as int,
      movies: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$MovieSimilarToJson(MovieSimilar instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies.map((e) => e.toJson()).toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
