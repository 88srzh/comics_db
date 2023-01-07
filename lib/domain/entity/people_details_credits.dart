// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'people_details_credits.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PeopleDetailsCredits {
  final List<Actor> cast;
  final List<Employee> crew;

  PeopleDetailsCredits({required this.cast, required this.crew});

  factory PeopleDetailsCredits.fromJson(Map<String, dynamic> json) =>
      _$PeopleDetailsCreditsFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleDetailsCreditsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Actor {
  final String character;
  final String creditId;
  final String releaseDate;
  final int voteCount;
  final bool video;
  final bool adult;
  final double voteAverage;
  final String title;
  final List<int> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final double popularity;
  final int id;
  final String? backdropPath;
  final String overview;
  final String? posterPath;

  Actor({
    required this.character,
    required this.creditId,
    required this.releaseDate,
    required this.voteCount,
    required this.video,
    required this.adult,
    required this.voteAverage,
    required this.title,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.popularity,
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Employee {
  final int id;
  final String department;
  final String originalLanguage;
  final String originalTitle;
  final String job;
  final String overview;
  final int voteCount;
  final bool video;
  final String? posterPath;
  final String? backdropPath;
  final String title;
  final double popularity;
  final List<int> genreIds;
  final double voteAverage;
  final bool adult;
  final String releaseDate;
  final String creditId;

  Employee({
    required this.id,
    required this.department,
    required this.originalLanguage,
    required this.originalTitle,
    required this.job,
    required this.overview,
    required this.voteCount,
    required this.video,
    required this.posterPath,
    required this.backdropPath,
    required this.title,
    required this.popularity,
    required this.genreIds,
    required this.voteAverage,
    required this.adult,
    required this.releaseDate,
    required this.creditId,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
