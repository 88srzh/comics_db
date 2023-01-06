// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadDetails,
    required TResult Function() loadReset,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadDetails,
    TResult? Function()? loadReset,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadDetails,
    TResult Function()? loadReset,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountDetailsEventLoadDetails value) loadDetails,
    required TResult Function(AccountDetailsEventLoadReset value) loadReset,
    required TResult Function(AccountLogoutEvent value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountDetailsEventLoadDetails value)? loadDetails,
    TResult? Function(AccountDetailsEventLoadReset value)? loadReset,
    TResult? Function(AccountLogoutEvent value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountDetailsEventLoadDetails value)? loadDetails,
    TResult Function(AccountDetailsEventLoadReset value)? loadReset,
    TResult Function(AccountLogoutEvent value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDetailsEventCopyWith<$Res> {
  factory $AccountDetailsEventCopyWith(
          AccountDetailsEvent value, $Res Function(AccountDetailsEvent) then) =
      _$AccountDetailsEventCopyWithImpl<$Res, AccountDetailsEvent>;
}

/// @nodoc
class _$AccountDetailsEventCopyWithImpl<$Res, $Val extends AccountDetailsEvent>
    implements $AccountDetailsEventCopyWith<$Res> {
  _$AccountDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AccountDetailsEventLoadDetailsCopyWith<$Res> {
  factory _$$AccountDetailsEventLoadDetailsCopyWith(
          _$AccountDetailsEventLoadDetails value,
          $Res Function(_$AccountDetailsEventLoadDetails) then) =
      __$$AccountDetailsEventLoadDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$AccountDetailsEventLoadDetailsCopyWithImpl<$Res>
    extends _$AccountDetailsEventCopyWithImpl<$Res,
        _$AccountDetailsEventLoadDetails>
    implements _$$AccountDetailsEventLoadDetailsCopyWith<$Res> {
  __$$AccountDetailsEventLoadDetailsCopyWithImpl(
      _$AccountDetailsEventLoadDetails _value,
      $Res Function(_$AccountDetailsEventLoadDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$AccountDetailsEventLoadDetails(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountDetailsEventLoadDetails
    implements AccountDetailsEventLoadDetails {
  _$AccountDetailsEventLoadDetails({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'AccountDetailsEvent.loadDetails(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDetailsEventLoadDetails &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDetailsEventLoadDetailsCopyWith<_$AccountDetailsEventLoadDetails>
      get copyWith => __$$AccountDetailsEventLoadDetailsCopyWithImpl<
          _$AccountDetailsEventLoadDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadDetails,
    required TResult Function() loadReset,
    required TResult Function() logout,
  }) {
    return loadDetails(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadDetails,
    TResult? Function()? loadReset,
    TResult? Function()? logout,
  }) {
    return loadDetails?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadDetails,
    TResult Function()? loadReset,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (loadDetails != null) {
      return loadDetails(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountDetailsEventLoadDetails value) loadDetails,
    required TResult Function(AccountDetailsEventLoadReset value) loadReset,
    required TResult Function(AccountLogoutEvent value) logout,
  }) {
    return loadDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountDetailsEventLoadDetails value)? loadDetails,
    TResult? Function(AccountDetailsEventLoadReset value)? loadReset,
    TResult? Function(AccountLogoutEvent value)? logout,
  }) {
    return loadDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountDetailsEventLoadDetails value)? loadDetails,
    TResult Function(AccountDetailsEventLoadReset value)? loadReset,
    TResult Function(AccountLogoutEvent value)? logout,
    required TResult orElse(),
  }) {
    if (loadDetails != null) {
      return loadDetails(this);
    }
    return orElse();
  }
}

abstract class AccountDetailsEventLoadDetails implements AccountDetailsEvent {
  factory AccountDetailsEventLoadDetails({required final String locale}) =
      _$AccountDetailsEventLoadDetails;

  String get locale;
  @JsonKey(ignore: true)
  _$$AccountDetailsEventLoadDetailsCopyWith<_$AccountDetailsEventLoadDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountDetailsEventLoadResetCopyWith<$Res> {
  factory _$$AccountDetailsEventLoadResetCopyWith(
          _$AccountDetailsEventLoadReset value,
          $Res Function(_$AccountDetailsEventLoadReset) then) =
      __$$AccountDetailsEventLoadResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountDetailsEventLoadResetCopyWithImpl<$Res>
    extends _$AccountDetailsEventCopyWithImpl<$Res,
        _$AccountDetailsEventLoadReset>
    implements _$$AccountDetailsEventLoadResetCopyWith<$Res> {
  __$$AccountDetailsEventLoadResetCopyWithImpl(
      _$AccountDetailsEventLoadReset _value,
      $Res Function(_$AccountDetailsEventLoadReset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AccountDetailsEventLoadReset implements AccountDetailsEventLoadReset {
  _$AccountDetailsEventLoadReset();

  @override
  String toString() {
    return 'AccountDetailsEvent.loadReset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDetailsEventLoadReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadDetails,
    required TResult Function() loadReset,
    required TResult Function() logout,
  }) {
    return loadReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadDetails,
    TResult? Function()? loadReset,
    TResult? Function()? logout,
  }) {
    return loadReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadDetails,
    TResult Function()? loadReset,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (loadReset != null) {
      return loadReset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountDetailsEventLoadDetails value) loadDetails,
    required TResult Function(AccountDetailsEventLoadReset value) loadReset,
    required TResult Function(AccountLogoutEvent value) logout,
  }) {
    return loadReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountDetailsEventLoadDetails value)? loadDetails,
    TResult? Function(AccountDetailsEventLoadReset value)? loadReset,
    TResult? Function(AccountLogoutEvent value)? logout,
  }) {
    return loadReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountDetailsEventLoadDetails value)? loadDetails,
    TResult Function(AccountDetailsEventLoadReset value)? loadReset,
    TResult Function(AccountLogoutEvent value)? logout,
    required TResult orElse(),
  }) {
    if (loadReset != null) {
      return loadReset(this);
    }
    return orElse();
  }
}

abstract class AccountDetailsEventLoadReset implements AccountDetailsEvent {
  factory AccountDetailsEventLoadReset() = _$AccountDetailsEventLoadReset;
}

/// @nodoc
abstract class _$$AccountLogoutEventCopyWith<$Res> {
  factory _$$AccountLogoutEventCopyWith(_$AccountLogoutEvent value,
          $Res Function(_$AccountLogoutEvent) then) =
      __$$AccountLogoutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountLogoutEventCopyWithImpl<$Res>
    extends _$AccountDetailsEventCopyWithImpl<$Res, _$AccountLogoutEvent>
    implements _$$AccountLogoutEventCopyWith<$Res> {
  __$$AccountLogoutEventCopyWithImpl(
      _$AccountLogoutEvent _value, $Res Function(_$AccountLogoutEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AccountLogoutEvent implements AccountLogoutEvent {
  _$AccountLogoutEvent();

  @override
  String toString() {
    return 'AccountDetailsEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountLogoutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadDetails,
    required TResult Function() loadReset,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadDetails,
    TResult? Function()? loadReset,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadDetails,
    TResult Function()? loadReset,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountDetailsEventLoadDetails value) loadDetails,
    required TResult Function(AccountDetailsEventLoadReset value) loadReset,
    required TResult Function(AccountLogoutEvent value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountDetailsEventLoadDetails value)? loadDetails,
    TResult? Function(AccountDetailsEventLoadReset value)? loadReset,
    TResult? Function(AccountLogoutEvent value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountDetailsEventLoadDetails value)? loadDetails,
    TResult Function(AccountDetailsEventLoadReset value)? loadReset,
    TResult Function(AccountLogoutEvent value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class AccountLogoutEvent implements AccountDetailsEvent {
  factory AccountLogoutEvent() = _$AccountLogoutEvent;
}
