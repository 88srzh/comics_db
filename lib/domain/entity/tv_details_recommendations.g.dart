// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_details_recommendations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvDetailsRecommendations _$TvDetailsRecommendationsFromJson(
        Map<String, dynamic> json) =>
    TvDetailsRecommendations(
      page: json['page'] as int,
      recommendationsList: (json['results'] as List<dynamic>)
          .map((e) =>
              TvDetailsRecommendationsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvDetailsRecommendationsToJson(
        TvDetailsRecommendations instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.recommendationsList.map((e) => e.toJson()).toList(),
    };

TvDetailsRecommendationsList _$TvDetailsRecommendationsListFromJson(
        Map<String, dynamic> json) =>
    TvDetailsRecommendationsList(
      id: json['id'] as int,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TvDetailsRecommendationsListToJson(
        TvDetailsRecommendationsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'name': instance.name,
    };
