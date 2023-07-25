// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountDetails _$AccountDetailsFromJson(Map<String, dynamic> json) {
  return _AccountDetails.fromJson(json);
}

/// @nodoc
mixin _$AccountDetails {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_639_1')
  String get iso6391 => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_3166_1')
  String get iso31661 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get includeAdult => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDetailsCopyWith<AccountDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDetailsCopyWith<$Res> {
  factory $AccountDetailsCopyWith(
          AccountDetails value, $Res Function(AccountDetails) then) =
      _$AccountDetailsCopyWithImpl<$Res, AccountDetails>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'iso_639_1') String iso6391,
      @JsonKey(name: 'iso_3166_1') String iso31661,
      String name,
      bool includeAdult,
      String username});
}

/// @nodoc
class _$AccountDetailsCopyWithImpl<$Res, $Val extends AccountDetails>
    implements $AccountDetailsCopyWith<$Res> {
  _$AccountDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iso6391 = null,
    Object? iso31661 = null,
    Object? name = null,
    Object? includeAdult = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      iso31661: null == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      includeAdult: null == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountDetailsCopyWith<$Res>
    implements $AccountDetailsCopyWith<$Res> {
  factory _$$_AccountDetailsCopyWith(
          _$_AccountDetails value, $Res Function(_$_AccountDetails) then) =
      __$$_AccountDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'iso_639_1') String iso6391,
      @JsonKey(name: 'iso_3166_1') String iso31661,
      String name,
      bool includeAdult,
      String username});
}

/// @nodoc
class __$$_AccountDetailsCopyWithImpl<$Res>
    extends _$AccountDetailsCopyWithImpl<$Res, _$_AccountDetails>
    implements _$$_AccountDetailsCopyWith<$Res> {
  __$$_AccountDetailsCopyWithImpl(
      _$_AccountDetails _value, $Res Function(_$_AccountDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iso6391 = null,
    Object? iso31661 = null,
    Object? name = null,
    Object? includeAdult = null,
    Object? username = null,
  }) {
    return _then(_$_AccountDetails(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      iso31661: null == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      includeAdult: null == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_AccountDetails implements _AccountDetails {
  _$_AccountDetails(
      {required this.id,
      @JsonKey(name: 'iso_639_1') required this.iso6391,
      @JsonKey(name: 'iso_3166_1') required this.iso31661,
      required this.name,
      required this.includeAdult,
      required this.username});

  factory _$_AccountDetails.fromJson(Map<String, dynamic> json) =>
      _$$_AccountDetailsFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @override
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  @override
  final String name;
  @override
  final bool includeAdult;
  @override
  final String username;

  @override
  String toString() {
    return 'AccountDetails(id: $id, iso6391: $iso6391, iso31661: $iso31661, name: $name, includeAdult: $includeAdult, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.iso6391, iso6391) || other.iso6391 == iso6391) &&
            (identical(other.iso31661, iso31661) ||
                other.iso31661 == iso31661) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.includeAdult, includeAdult) ||
                other.includeAdult == includeAdult) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, iso6391, iso31661, name, includeAdult, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDetailsCopyWith<_$_AccountDetails> get copyWith =>
      __$$_AccountDetailsCopyWithImpl<_$_AccountDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountDetailsToJson(
      this,
    );
  }
}

abstract class _AccountDetails implements AccountDetails {
  factory _AccountDetails(
      {required final int id,
      @JsonKey(name: 'iso_639_1') required final String iso6391,
      @JsonKey(name: 'iso_3166_1') required final String iso31661,
      required final String name,
      required final bool includeAdult,
      required final String username}) = _$_AccountDetails;

  factory _AccountDetails.fromJson(Map<String, dynamic> json) =
      _$_AccountDetails.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'iso_639_1')
  String get iso6391;
  @override
  @JsonKey(name: 'iso_3166_1')
  String get iso31661;
  @override
  String get name;
  @override
  bool get includeAdult;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDetailsCopyWith<_$_AccountDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
