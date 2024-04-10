// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_details_keywords.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvDetailsKeywords _$TvDetailsKeywordsFromJson(Map<String, dynamic> json) =>
    TvDetailsKeywords(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) =>
              TvDetailsKeywordsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvDetailsKeywordsToJson(TvDetailsKeywords instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

TvDetailsKeywordsResult _$TvDetailsKeywordsResultFromJson(
        Map<String, dynamic> json) =>
    TvDetailsKeywordsResult(
      name: json['name'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$TvDetailsKeywordsResultToJson(
        TvDetailsKeywordsResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
