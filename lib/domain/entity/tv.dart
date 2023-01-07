// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'tv.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TV {
  final String? posterPath;
  final double popularity;
  final int id;
  final String? backdropPath;
  final double voteAverage;
  final String overview;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? firstAirDate;
  final List<String> originCountry;
  final List<int> genreIds;
  final String originalLanguage;
  final double voteCount;
  final String name;
  final String originalName;

  TV({
    required this.posterPath,
    required this.popularity,
    required this.id,
    required this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.firstAirDate,
    required this.originCountry,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.name,
    required this.originalName,
  });

  factory TV.fromJson(Map<String, dynamic> json) => _$TVFromJson(json);

  Map<String, dynamic> toJson() => _$TVToJson(this);

  static DateTime? parseDateFromString(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }
}
