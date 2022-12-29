


import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_response.freezed.dart';
part 'personal_response.g.dart';

@freezed
class PersonalResponse with _$PersonalResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory PersonalResponse({
  required int id,
  @JsonKey(name: 'iso_693_1')
  required String iso6391,
  @JsonKey(name: 'iso_3166_1')
  required String iso31661,
  required String name,
  required bool includeAdult,
  required String username,
}) = _PersonalResponse;

  factory PersonalResponse.fromJson(Map<String, dynamic> json) => _$PersonalResponseFromJson(json);

}