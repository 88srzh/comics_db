// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_account_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestAccountDetails _$GuestAccountDetailsFromJson(Map<String, dynamic> json) =>
    GuestAccountDetails(
      guestSessionId: json['guest_session_id'] as String,
      expiresAt: json['expires_at'] as String,
    );

Map<String, dynamic> _$GuestAccountDetailsToJson(
        GuestAccountDetails instance) =>
    <String, dynamic>{
      'guest_session_id': instance.guestSessionId,
      'expires_at': instance.expiresAt,
    };
