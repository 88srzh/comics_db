import 'package:comics_db_app/domain/entity/people.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PeopleResponse {
  final int page;
  @JsonKey(name: 'results')
  List<People> people;
  final int totalResults;
  final int totalPages;

  PeopleResponse({
    required this.page,
    required this.people,
    required this.totalResults,
    required this.totalPages,
  });

  factory PeopleResponse.fromJson(Map<String, dynamic> json) => _$PeopleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PeopleResponseToJson(this);
}
