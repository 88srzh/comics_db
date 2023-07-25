// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_all_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingAllResponse _$TrendingAllResponseFromJson(Map<String, dynamic> json) =>
    TrendingAllResponse(
      page: json['page'] as int,
      trendingAll: (json['results'] as List<dynamic>)
          .map((e) => TrendingAll.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$TrendingAllResponseToJson(
        TrendingAllResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.trendingAll.map((e) => e.toJson()).toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
