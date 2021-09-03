// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_all_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestAllResponse _$LatestAllResponseFromJson(Map<String, dynamic> json) {
  return LatestAllResponse(
    page: json['page'] as int,
    latestAll: (json['results'] as List<dynamic>)
        .map((e) => LatestAll.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalResults: json['total_results'] as int,
    totalPages: json['total_pages'] as int,
  );
}

Map<String, dynamic> _$LatestAllResponseToJson(LatestAllResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.latestAll.map((e) => e.toJson()).toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
