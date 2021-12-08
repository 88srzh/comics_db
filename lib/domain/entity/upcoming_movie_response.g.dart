// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingMovieResponse _$UpcomingMovieResponseFromJson(
    Map<String, dynamic> json) {
  return UpcomingMovieResponse(
    page: json['page'] as int,
    movies: (json['results'] as List<dynamic>)
        .map((e) => Movie.fromJson(e as Map<String, dynamic>))
        .toList(),
    dates: (json['dates'] as List<dynamic>)
        .map((e) => MovieDates.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalResults: json['total_results'] as int,
    totalPages: json['total_pages'] as int,
  );
}

Map<String, dynamic> _$UpcomingMovieResponseToJson(
        UpcomingMovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies.map((e) => e.toJson()).toList(),
      'dates': instance.dates.map((e) => e.toJson()).toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
