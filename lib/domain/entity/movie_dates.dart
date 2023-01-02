import 'package:json_annotation/json_annotation.dart';

part 'movie_dates.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDates {
  final String maximum;
  final String minimum;

  MovieDates({
      required this.maximum,
      required this.minimum,
  });

  factory MovieDates.fromJson(Map<String, dynamic> json) => _$MovieDatesFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDatesToJson(this);
}