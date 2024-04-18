// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function() checkStatus,
    required TResult Function(String login, String password) login,
    required TResult Function() guestLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function()? checkStatus,
    TResult? Function(String login, String password)? login,
    TResult? Function()? guestLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function()? checkStatus,
    TResult Function(String login, String password)? login,
    TResult Function()? guestLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLogOutEvent value) logout,
    required TResult Function(AuthCheckStatusEvent value) checkStatus,
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(GuestAuthLoginEvent value) guestLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLogOutEvent value)? logout,
    TResult? Function(AuthCheckStatusEvent value)? checkStatus,
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(GuestAuthLoginEvent value)? guestLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLogOutEvent value)? logout,
    TResult Function(AuthCheckStatusEvent value)? checkStatus,
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(GuestAuthLoginEvent value)? guestLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthLogOutEventImplCopyWith<$Res> {
  factory _$$AuthLogOutEventImplCopyWith(_$AuthLogOutEventImpl value,
          $Res Function(_$AuthLogOutEventImpl) then) =
      __$$AuthLogOutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogOutEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogOutEventImpl>
    implements _$$AuthLogOutEventImplCopyWith<$Res> {
  __$$AuthLogOutEventImplCopyWithImpl(
      _$AuthLogOutEventImpl _value, $Res Function(_$AuthLogOutEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLogOutEventImpl implements AuthLogOutEvent {
  const _$AuthLogOutEventImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogOutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function() checkStatus,
    required TResult Function(String login, String password) login,
    required TResult Function() guestLogin,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function()? checkStatus,
    TResult? Function(String login, String password)? login,
    TResult? Function()? guestLogin,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function()? checkStatus,
    TResult Function(String login, String password)? login,
    TResult Function()? guestLogin,
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
    required TResult Function(AuthLogOutEvent value) logout,
    required TResult Function(AuthCheckStatusEvent value) checkStatus,
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(GuestAuthLoginEvent value) guestLogin,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLogOutEvent value)? logout,
    TResult? Function(AuthCheckStatusEvent value)? checkStatus,
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(GuestAuthLoginEvent value)? guestLogin,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLogOutEvent value)? logout,
    TResult Function(AuthCheckStatusEvent value)? checkStatus,
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(GuestAuthLoginEvent value)? guestLogin,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class AuthLogOutEvent implements AuthEvent {
  const factory AuthLogOutEvent() = _$AuthLogOutEventImpl;
}

/// @nodoc
abstract class _$$AuthCheckStatusEventImplCopyWith<$Res> {
  factory _$$AuthCheckStatusEventImplCopyWith(_$AuthCheckStatusEventImpl value,
          $Res Function(_$AuthCheckStatusEventImpl) then) =
      __$$AuthCheckStatusEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthCheckStatusEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthCheckStatusEventImpl>
    implements _$$AuthCheckStatusEventImplCopyWith<$Res> {
  __$$AuthCheckStatusEventImplCopyWithImpl(_$AuthCheckStatusEventImpl _value,
      $Res Function(_$AuthCheckStatusEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthCheckStatusEventImpl implements AuthCheckStatusEvent {
  const _$AuthCheckStatusEventImpl();

  @override
  String toString() {
    return 'AuthEvent.checkStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCheckStatusEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function() checkStatus,
    required TResult Function(String login, String password) login,
    required TResult Function() guestLogin,
  }) {
    return checkStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function()? checkStatus,
    TResult? Function(String login, String password)? login,
    TResult? Function()? guestLogin,
  }) {
    return checkStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function()? checkStatus,
    TResult Function(String login, String password)? login,
    TResult Function()? guestLogin,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLogOutEvent value) logout,
    required TResult Function(AuthCheckStatusEvent value) checkStatus,
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(GuestAuthLoginEvent value) guestLogin,
  }) {
    return checkStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLogOutEvent value)? logout,
    TResult? Function(AuthCheckStatusEvent value)? checkStatus,
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(GuestAuthLoginEvent value)? guestLogin,
  }) {
    return checkStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLogOutEvent value)? logout,
    TResult Function(AuthCheckStatusEvent value)? checkStatus,
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(GuestAuthLoginEvent value)? guestLogin,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus(this);
    }
    return orElse();
  }
}

abstract class AuthCheckStatusEvent implements AuthEvent {
  const factory AuthCheckStatusEvent() = _$AuthCheckStatusEventImpl;
}

/// @nodoc
abstract class _$$AuthLoginEventImplCopyWith<$Res> {
  factory _$$AuthLoginEventImplCopyWith(_$AuthLoginEventImpl value,
          $Res Function(_$AuthLoginEventImpl) then) =
      __$$AuthLoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String login, String password});
}

/// @nodoc
class __$$AuthLoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLoginEventImpl>
    implements _$$AuthLoginEventImplCopyWith<$Res> {
  __$$AuthLoginEventImplCopyWithImpl(
      _$AuthLoginEventImpl _value, $Res Function(_$AuthLoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
  }) {
    return _then(_$AuthLoginEventImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthLoginEventImpl implements AuthLoginEvent {
  const _$AuthLoginEventImpl({required this.login, required this.password});

  @override
  final String login;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(login: $login, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginEventImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoginEventImplCopyWith<_$AuthLoginEventImpl> get copyWith =>
      __$$AuthLoginEventImplCopyWithImpl<_$AuthLoginEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function() checkStatus,
    required TResult Function(String login, String password) login,
    required TResult Function() guestLogin,
  }) {
    return login(this.login, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function()? checkStatus,
    TResult? Function(String login, String password)? login,
    TResult? Function()? guestLogin,
  }) {
    return login?.call(this.login, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function()? checkStatus,
    TResult Function(String login, String password)? login,
    TResult Function()? guestLogin,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this.login, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLogOutEvent value) logout,
    required TResult Function(AuthCheckStatusEvent value) checkStatus,
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(GuestAuthLoginEvent value) guestLogin,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLogOutEvent value)? logout,
    TResult? Function(AuthCheckStatusEvent value)? checkStatus,
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(GuestAuthLoginEvent value)? guestLogin,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLogOutEvent value)? logout,
    TResult Function(AuthCheckStatusEvent value)? checkStatus,
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(GuestAuthLoginEvent value)? guestLogin,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class AuthLoginEvent implements AuthEvent {
  const factory AuthLoginEvent(
      {required final String login,
      required final String password}) = _$AuthLoginEventImpl;

  String get login;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthLoginEventImplCopyWith<_$AuthLoginEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GuestAuthLoginEventImplCopyWith<$Res> {
  factory _$$GuestAuthLoginEventImplCopyWith(_$GuestAuthLoginEventImpl value,
          $Res Function(_$GuestAuthLoginEventImpl) then) =
      __$$GuestAuthLoginEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GuestAuthLoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$GuestAuthLoginEventImpl>
    implements _$$GuestAuthLoginEventImplCopyWith<$Res> {
  __$$GuestAuthLoginEventImplCopyWithImpl(_$GuestAuthLoginEventImpl _value,
      $Res Function(_$GuestAuthLoginEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GuestAuthLoginEventImpl implements GuestAuthLoginEvent {
  const _$GuestAuthLoginEventImpl();

  @override
  String toString() {
    return 'AuthEvent.guestLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestAuthLoginEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function() checkStatus,
    required TResult Function(String login, String password) login,
    required TResult Function() guestLogin,
  }) {
    return guestLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function()? checkStatus,
    TResult? Function(String login, String password)? login,
    TResult? Function()? guestLogin,
  }) {
    return guestLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function()? checkStatus,
    TResult Function(String login, String password)? login,
    TResult Function()? guestLogin,
    required TResult orElse(),
  }) {
    if (guestLogin != null) {
      return guestLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLogOutEvent value) logout,
    required TResult Function(AuthCheckStatusEvent value) checkStatus,
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(GuestAuthLoginEvent value) guestLogin,
  }) {
    return guestLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLogOutEvent value)? logout,
    TResult? Function(AuthCheckStatusEvent value)? checkStatus,
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(GuestAuthLoginEvent value)? guestLogin,
  }) {
    return guestLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLogOutEvent value)? logout,
    TResult Function(AuthCheckStatusEvent value)? checkStatus,
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(GuestAuthLoginEvent value)? guestLogin,
    required TResult orElse(),
  }) {
    if (guestLogin != null) {
      return guestLogin(this);
    }
    return orElse();
  }
}

abstract class GuestAuthLoginEvent implements AuthEvent {
  const factory GuestAuthLoginEvent() = _$GuestAuthLoginEventImpl;
}
