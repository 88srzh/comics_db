// Package imports:
import 'package:comics_db_app/domain/entity/account_avatar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AccountDetails {
  final int id;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  final bool includeAdult;
  final String username;
  final Avatar avatar;

  AccountDetails({
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.includeAdult,
    required this.username,
    required this.avatar,
  });

  factory AccountDetails.fromJson(Map<String, dynamic> json) => _$AccountDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDetailsToJson(this);
}


