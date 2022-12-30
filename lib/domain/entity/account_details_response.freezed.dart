// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountDetailsResponse _$AccountDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _AccountDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$AccountDetailsResponse {
  List<AccountDetails> get accountDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDetailsResponseCopyWith<AccountDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDetailsResponseCopyWith<$Res> {
  factory $AccountDetailsResponseCopyWith(AccountDetailsResponse value,
          $Res Function(AccountDetailsResponse) then) =
      _$AccountDetailsResponseCopyWithImpl<$Res, AccountDetailsResponse>;
  @useResult
  $Res call({List<AccountDetails> accountDetails});
}

/// @nodoc
class _$AccountDetailsResponseCopyWithImpl<$Res,
        $Val extends AccountDetailsResponse>
    implements $AccountDetailsResponseCopyWith<$Res> {
  _$AccountDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountDetails = null,
  }) {
    return _then(_value.copyWith(
      accountDetails: null == accountDetails
          ? _value.accountDetails
          : accountDetails // ignore: cast_nullable_to_non_nullable
              as List<AccountDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountDetailsResponseCopyWith<$Res>
    implements $AccountDetailsResponseCopyWith<$Res> {
  factory _$$_AccountDetailsResponseCopyWith(_$_AccountDetailsResponse value,
          $Res Function(_$_AccountDetailsResponse) then) =
      __$$_AccountDetailsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AccountDetails> accountDetails});
}

/// @nodoc
class __$$_AccountDetailsResponseCopyWithImpl<$Res>
    extends _$AccountDetailsResponseCopyWithImpl<$Res,
        _$_AccountDetailsResponse>
    implements _$$_AccountDetailsResponseCopyWith<$Res> {
  __$$_AccountDetailsResponseCopyWithImpl(_$_AccountDetailsResponse _value,
      $Res Function(_$_AccountDetailsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountDetails = null,
  }) {
    return _then(_$_AccountDetailsResponse(
      accountDetails: null == accountDetails
          ? _value._accountDetails
          : accountDetails // ignore: cast_nullable_to_non_nullable
              as List<AccountDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountDetailsResponse implements _AccountDetailsResponse {
  _$_AccountDetailsResponse(
      {required final List<AccountDetails> accountDetails})
      : _accountDetails = accountDetails;

  factory _$_AccountDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AccountDetailsResponseFromJson(json);

  final List<AccountDetails> _accountDetails;
  @override
  List<AccountDetails> get accountDetails {
    if (_accountDetails is EqualUnmodifiableListView) return _accountDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountDetails);
  }

  @override
  String toString() {
    return 'AccountDetailsResponse(accountDetails: $accountDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountDetailsResponse &&
            const DeepCollectionEquality()
                .equals(other._accountDetails, _accountDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_accountDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDetailsResponseCopyWith<_$_AccountDetailsResponse> get copyWith =>
      __$$_AccountDetailsResponseCopyWithImpl<_$_AccountDetailsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountDetailsResponseToJson(
      this,
    );
  }
}

abstract class _AccountDetailsResponse implements AccountDetailsResponse {
  factory _AccountDetailsResponse(
          {required final List<AccountDetails> accountDetails}) =
      _$_AccountDetailsResponse;

  factory _AccountDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$_AccountDetailsResponse.fromJson;

  @override
  List<AccountDetails> get accountDetails;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDetailsResponseCopyWith<_$_AccountDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
