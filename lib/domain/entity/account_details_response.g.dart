// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountDetailsResponseImpl _$$AccountDetailsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountDetailsResponseImpl(
      accountDetails: (json['accountDetails'] as List<dynamic>)
          .map((e) => AccountDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AccountDetailsResponseImplToJson(
        _$AccountDetailsResponseImpl instance) =>
    <String, dynamic>{
      'accountDetails': instance.accountDetails,
    };
