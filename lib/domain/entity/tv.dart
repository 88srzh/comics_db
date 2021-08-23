import 'package:json_annotation/json_annotation.dart';

part 'tv.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)

class TV {
  final int id;
  final String? posterPath;
  final String gender;
  final List<String> languages;
  final String? backdropPath;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<int> genreIds;
  final String originalLanguage;
  final double popularity;
  final List<int> seasonsIds;
  final double voteAverage;
  final double voteCount;

  TV({
    required this.id,
    required this.posterPath,
    required this.gender,
    required this.languages,
    required this.backdropPath,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genreIds,
    required this.originalLanguage,
    required this.popularity,
    required this.seasonsIds,
    required this.voteAverage,
    required this.voteCount});

    factory TV.fromJson(Map<String, dynamic> json) => _$TVFromJson(json);

    Map<String, dynamic> toJson() => _$TVToJson(this);

      static DateTime? parseDateFromString(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }

}