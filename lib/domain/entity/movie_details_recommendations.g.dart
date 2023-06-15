// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_recommendations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsRecommendations _$MovieDetailsRecommendationsFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsRecommendations(
      page: json['page'] as int,
      recommendationsList: (json['results'] as List<dynamic>)
          .map((e) => MovieDetailsRecommendationsList.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailsRecommendationsToJson(
        MovieDetailsRecommendations instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.recommendationsList.map((e) => e.toJson()).toList(),
    };

MovieDetailsRecommendationsList _$MovieDetailsRecommendationsListFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsRecommendationsList(
      id: json['id'] as int,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$MovieDetailsRecommendationsListToJson(
        MovieDetailsRecommendationsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
    };
