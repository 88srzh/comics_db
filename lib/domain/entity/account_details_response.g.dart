// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDetailsResponse _$$_AccountDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AccountDetailsResponse(
      accountDetails: (json['accountDetails'] as List<dynamic>)
          .map((e) => AccountDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AccountDetailsResponseToJson(
        _$_AccountDetailsResponse instance) =>
    <String, dynamic>{
      'accountDetails': instance.accountDetails,
    };
