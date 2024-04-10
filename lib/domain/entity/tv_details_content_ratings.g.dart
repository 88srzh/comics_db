// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_details_content_ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvDetailsContentRatings _$TvDetailsContentRatingsFromJson(
        Map<String, dynamic> json) =>
    TvDetailsContentRatings(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) =>
              TvDetailsContentRatingsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvDetailsContentRatingsToJson(
        TvDetailsContentRatings instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

TvDetailsContentRatingsResult _$TvDetailsContentRatingsResultFromJson(
        Map<String, dynamic> json) =>
    TvDetailsContentRatingsResult(
      descriptors: json['descriptors'] as List<dynamic>?,
      iso: json['iso_3166_1'] as String,
      rating: json['rating'] as String,
    );

Map<String, dynamic> _$TvDetailsContentRatingsResultToJson(
        TvDetailsContentRatingsResult instance) =>
    <String, dynamic>{
      'descriptors': instance.descriptors,
      'iso_3166_1': instance.iso,
      'rating': instance.rating,
    };
