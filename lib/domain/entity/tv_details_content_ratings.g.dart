// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_details_content_ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvDetailsContentRatings _$TvDetailsContentRatingsFromJson(
        Map<String, dynamic> json) =>
    TvDetailsContentRatings(
      id: json['results'] as int,
      ratingsList: (json['ratings_list'] as List<dynamic>)
          .map((e) =>
              TvDetailsContentRatingsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvDetailsContentRatingsToJson(
        TvDetailsContentRatings instance) =>
    <String, dynamic>{
      'results': instance.id,
      'ratings_list': instance.ratingsList.map((e) => e.toJson()).toList(),
    };

TvDetailsContentRatingsList _$TvDetailsContentRatingsListFromJson(
        Map<String, dynamic> json) =>
    TvDetailsContentRatingsList(
      descriptors: json['descriptors'] as List<dynamic>,
      iso: json['iso_3166_1'] as String,
      rating: json['rating'] as String,
    );

Map<String, dynamic> _$TvDetailsContentRatingsListToJson(
        TvDetailsContentRatingsList instance) =>
    <String, dynamic>{
      'descriptors': instance.descriptors,
      'iso_3166_1': instance.iso,
      'rating': instance.rating,
    };
