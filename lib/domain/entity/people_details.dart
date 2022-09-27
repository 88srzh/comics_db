import 'package:comics_db_app/domain/entity/people_known_for.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PeopleDetails {
  final String? birthday;
  final String knownForDepartment;
  final String? deathday;
  final int id;
  final String name;
  final List<String> alsoKnownAs;

  // TODO default: 0, minimum 0, maximum 3
  final int gender;
  final String biography;
  final double popularity;
  final String? placeOfBirth;
  final String? profilePath;
  final bool adult;
  final String imdbId;
  final String? homepage;
  final PeopleKnownFor knownFor;

  PeopleDetails({
    required this.birthday,
    required this.knownForDepartment,
    required this.deathday,
    required this.id,
    required this.name,
    required this.alsoKnownAs,
    required this.gender,
    required this.biography,
    required this.popularity,
    required this.placeOfBirth,
    required this.profilePath,
    required this.adult,
    required this.imdbId,
    required this.homepage,
    required this.knownFor,
  });

  factory PeopleDetails.fromJson(Map<String, dynamic> json) => _$PeopleDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PeopleDetailsToJson(this);
}
