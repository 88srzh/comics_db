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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function() checkStatus,
    required TResult Function(String login, String password) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function()? checkStatus,
    TResult? Function(String login, String password)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function()? checkStatus,
    TResult Function(String login, String password)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLogOutEvent value) logout,
    required TResult Function(AuthCheckStatusEvent value) checkStatus,
    required TResult Function(AuthLoginEvent value) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLogOutEvent value)? logout,
    TResult? Function(AuthCheckStatusEvent value)? checkStatus,
    TResult? Function(AuthLoginEvent value)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLogOutEvent value)? logout,
    TResult Function(AuthCheckStatusEvent value)? checkStatus,
    TResult Function(AuthLoginEvent value)? login,
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
abstract class _$$AuthLogOutEventCopyWith<$Res> {
  factory _$$AuthLogOutEventCopyWith(
          _$AuthLogOutEvent value, $Res Function(_$AuthLogOutEvent) then) =
      __$$AuthLogOutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogOutEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogOutEvent>
    implements _$$AuthLogOutEventCopyWith<$Res> {
  __$$AuthLogOutEventCopyWithImpl(
      _$AuthLogOutEvent _value, $Res Function(_$AuthLogOutEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLogOutEvent implements AuthLogOutEvent {
  const _$AuthLogOutEvent();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogOutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function() checkStatus,
    required TResult Function(String login, String password) login,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function()? checkStatus,
    TResult? Function(String login, String password)? login,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function()? checkStatus,
    TResult Function(String login, String password)? login,
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
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLogOutEvent value)? logout,
    TResult? Function(AuthCheckStatusEvent value)? checkStatus,
    TResult? Function(AuthLoginEvent value)? login,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLogOutEvent value)? logout,
    TResult Function(AuthCheckStatusEvent value)? checkStatus,
    TResult Function(AuthLoginEvent value)? login,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class AuthLogOutEvent implements AuthEvent {
  const factory AuthLogOutEvent() = _$AuthLogOutEvent;
}

/// @nodoc
abstract class _$$AuthCheckStatusEventCopyWith<$Res> {
  factory _$$AuthCheckStatusEventCopyWith(_$AuthCheckStatusEvent value,
          $Res Function(_$AuthCheckStatusEvent) then) =
      __$$AuthCheckStatusEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthCheckStatusEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthCheckStatusEvent>
    implements _$$AuthCheckStatusEventCopyWith<$Res> {
  __$$AuthCheckStatusEventCopyWithImpl(_$AuthCheckStatusEvent _value,
      $Res Function(_$AuthCheckStatusEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthCheckStatusEvent implements AuthCheckStatusEvent {
  const _$AuthCheckStatusEvent();

  @override
  String toString() {
    return 'AuthEvent.checkStatus()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthCheckStatusEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function() checkStatus,
    required TResult Function(String login, String password) login,
  }) {
    return checkStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function()? checkStatus,
    TResult? Function(String login, String password)? login,
  }) {
    return checkStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function()? checkStatus,
    TResult Function(String login, String password)? login,
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
  }) {
    return checkStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLogOutEvent value)? logout,
    TResult? Function(AuthCheckStatusEvent value)? checkStatus,
    TResult? Function(AuthLoginEvent value)? login,
  }) {
    return checkStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLogOutEvent value)? logout,
    TResult Function(AuthCheckStatusEvent value)? checkStatus,
    TResult Function(AuthLoginEvent value)? login,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus(this);
    }
    return orElse();
  }
}

abstract class AuthCheckStatusEvent implements AuthEvent {
  const factory AuthCheckStatusEvent() = _$AuthCheckStatusEvent;
}

/// @nodoc
abstract class _$$AuthLoginEventCopyWith<$Res> {
  factory _$$AuthLoginEventCopyWith(
          _$AuthLoginEvent value, $Res Function(_$AuthLoginEvent) then) =
      __$$AuthLoginEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String login, String password});
}

/// @nodoc
class __$$AuthLoginEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLoginEvent>
    implements _$$AuthLoginEventCopyWith<$Res> {
  __$$AuthLoginEventCopyWithImpl(
      _$AuthLoginEvent _value, $Res Function(_$AuthLoginEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
  }) {
    return _then(_$AuthLoginEvent(
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

class _$AuthLoginEvent implements AuthLoginEvent {
  const _$AuthLoginEvent({required this.login, required this.password});

  @override
  final String login;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(login: $login, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginEvent &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoginEventCopyWith<_$AuthLoginEvent> get copyWith =>
      __$$AuthLoginEventCopyWithImpl<_$AuthLoginEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function() checkStatus,
    required TResult Function(String login, String password) login,
  }) {
    return login(this.login, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function()? checkStatus,
    TResult? Function(String login, String password)? login,
  }) {
    return login?.call(this.login, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function()? checkStatus,
    TResult Function(String login, String password)? login,
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
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLogOutEvent value)? logout,
    TResult? Function(AuthCheckStatusEvent value)? checkStatus,
    TResult? Function(AuthLoginEvent value)? login,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLogOutEvent value)? logout,
    TResult Function(AuthCheckStatusEvent value)? checkStatus,
    TResult Function(AuthLoginEvent value)? login,
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
      required final String password}) = _$AuthLoginEvent;

  String get login;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthLoginEventCopyWith<_$AuthLoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
