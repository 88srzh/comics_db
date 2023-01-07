// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'people.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class People {
  final String profilePath;
  final bool adult;
  final int id;

  // TODO implement known_for type oneOf
  final String name;
  final double popularity;

  People({
    required this.profilePath,
    required this.adult,
    required this.id,
    required this.name,
    required this.popularity,
  });

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);
  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}
