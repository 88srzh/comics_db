import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details_response.freezed.dart';
part 'account_details_response.g.dart';

@freezed
class AccountDetailsResponse with _$AccountDetailsResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory AccountDetailsResponse({
  required int id,
  @JsonKey(name: 'iso_693_1')
  required String iso6391,
  @JsonKey(name: 'iso_3166_1')
  required String iso31661,
  required String name,
  required bool includeAdult,
  required String username,
}) = _AccountDetailsResponse;

  factory AccountDetailsResponse.fromJson(Map<String, dynamic> json) => _$AccountDetailsResponseFromJson(json);

}