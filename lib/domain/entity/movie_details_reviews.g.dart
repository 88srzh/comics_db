// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsReviews _$MovieDetailsReviewsFromJson(Map<String, dynamic> json) =>
    MovieDetailsReviews(
      result: (json['results'] as List<dynamic>)
          .map((e) =>
              MovieDetailsReviewsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailsReviewsToJson(
        MovieDetailsReviews instance) =>
    <String, dynamic>{
      'results': instance.result.map((e) => e.toJson()).toList(),
    };

MovieDetailsReviewsResult _$MovieDetailsReviewsResultFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsReviewsResult(
      author: json['author'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      url: json['url'] as String,
    );

Map<String, dynamic> _$MovieDetailsReviewsResultToJson(
        MovieDetailsReviewsResult instance) =>
    <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'updated_at': instance.updatedAt.toIso8601String(),
      'url': instance.url,
    };
