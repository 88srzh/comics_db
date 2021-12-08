// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDates _$MovieDatesFromJson(Map<String, dynamic> json) {
  return MovieDates(
    maximum: json['maximum'] as String,
    minimum: json['minimum'] as String,
  );
}

Map<String, dynamic> _$MovieDatesToJson(MovieDates instance) =>
    <String, dynamic>{
      'maximum': instance.maximum,
      'minimum': instance.minimum,
    };
