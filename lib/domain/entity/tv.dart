import 'package:json_annotation/json_annotation.dart';

part 'tv.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TV {
  final int id;
  final String? posterPath;
  final String overview;
  final List<String> originCountry;
  final String? backdropPath;
  final String firstAirDate;
  final List<int> genreIds;
  final String originalLanguage;
  final double popularity;
  final double voteAverage;
  final double voteCount;
  final String name;
  final String originalName;

  TV({
      required this.id,
      required this.posterPath,
      required this.overview,
      required this.originCountry,
      required this.backdropPath,
      required this.firstAirDate,
      required this.genreIds,
      required this.originalLanguage,
      required this.popularity,
      required this.voteAverage,
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
