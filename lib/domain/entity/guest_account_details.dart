

import 'package:json_annotation/json_annotation.dart';

part 'guest_account_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GuestAccountDetails {
  final String guestSessionId;
  final String expiresAt;

  const GuestAccountDetails({
    required this.guestSessionId,
    required this.expiresAt,
  });

  factory GuestAccountDetails.fromJson(Map<String, dynamic> json) => _$GuestAccountDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$GuestAccountDetailsToJson(this);
}