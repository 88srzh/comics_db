import 'package:comics_db_app/domain/entity/account_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details_response.freezed.dart';
part 'account_details_response.g.dart';

@freezed
class AccountDetailsResponse with _$AccountDetailsResponse {
  factory AccountDetailsResponse({
    required List<AccountDetails> accountDetails,
}) = _AccountDetailsResponse;

  factory AccountDetailsResponse.fromJson(Map<String, dynamic> json) => _$AccountDetailsResponseFromJson(json);
}