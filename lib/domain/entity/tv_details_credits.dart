import 'package:json_annotation/json_annotation.dart';

part 'tv_details_credits.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsCredits {
  List<TvActor> cast;
  List<TvEmployee> crew;

  TvDetailsCredits({
    required this.cast,
    required this.crew
  });

  factory TvDetailsCredits.fromJson(Map<String, dynamic> json) => _$TvDetailsCreditsFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsCreditsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvActor {
  bool adult;
  int? gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  int popularity;
  String? profilePath;
  String character;
  String creditId;
  int order;

  TvActor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.character,
    required this.creditId,
    required this.order
  });

  factory TvActor.fromJson(Map<String, dynamic> json) => _$TvActorFromJson(json);

  Map<String, dynamic> toJson() => _$TvActorToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvEmployee {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final int popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;

  TvEmployee({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job
  });

  factory TvEmployee.fromJson(Map<String, dynamic> json) => _$TvEmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$TvEmployeeToJson(this);
}

