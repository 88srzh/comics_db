// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsReviews _$MovieDetailsReviewsFromJson(Map<String, dynamic> json) =>
    MovieDetailsReviews(
      result: (json['result'] as List<dynamic>)
          .map((e) =>
              MovieDetailsReviewsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailsReviewsToJson(
        MovieDetailsReviews instance) =>
    <String, dynamic>{
      'result': instance.result.map((e) => e.toJson()).toList(),
    };

MovieDetailsReviewsResult _$MovieDetailsReviewsResultFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsReviewsResult(
      author: json['author'] as String,
      authorDetails: AuthorDetails.fromJson(
          json['author_details'] as Map<String, dynamic>),
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
      'author_details': instance.authorDetails.toJson(),
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'updated_at': instance.updatedAt.toIso8601String(),
      'url': instance.url,
    };

AuthorDetails _$AuthorDetailsFromJson(Map<String, dynamic> json) =>
    AuthorDetails(
      name: json['name'] as String?,
      username: json['username'] as String,
      avatarPath: json['avatar_path'] as String?,
      rating: json['rating'] as int?,
    );

Map<String, dynamic> _$AuthorDetailsToJson(AuthorDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar_path': instance.avatarPath,
      'rating': instance.rating,
    };
