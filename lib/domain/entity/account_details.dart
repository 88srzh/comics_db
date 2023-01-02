import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details.freezed.dart';
part 'account_details.g.dart';

@freezed
class AccountDetails with _$AccountDetails {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory AccountDetails({
  required int id,
  @JsonKey(name: 'iso_693_1')
  required String iso6391,
  @JsonKey(name: 'iso_3166_1')
  required String iso31661,
  required String name,
  required bool includeAdult,
  required String username,
}) = _AccountDetails;

  factory AccountDetails.fromJson(Map<String, dynamic> json) => _$AccountDetailsFromJson(json);

}