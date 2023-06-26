// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVResponse _$TVResponseFromJson(Map<String, dynamic> json) => TVResponse(
      page: json['page'] as int,
      tvs: (json['results'] as List<dynamic>)
          .map((e) => TV.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$TVResponseToJson(TVResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.tvs.map((e) => e.toJson()).toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
