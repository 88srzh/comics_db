// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_keywords.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsKeywords _$MovieDetailsKeywordsFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsKeywords(
      keywords: (json['keywords'] as List<dynamic>)
          .map((e) =>
              MovieDetailsKeywordsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailsKeywordsToJson(
        MovieDetailsKeywords instance) =>
    <String, dynamic>{
      'keywords': instance.keywords.map((e) => e.toJson()).toList(),
    };

MovieDetailsKeywordsResult _$MovieDetailsKeywordsResultFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsKeywordsResult(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MovieDetailsKeywordsResultToJson(
        MovieDetailsKeywordsResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
