// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonalDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadDetails,
    required TResult Function() loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadDetails,
    TResult? Function()? loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadDetails,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PersonalDetailsEventLoadDetails value)
        loadDetails,
    required TResult Function(PersonalDetailsEventLoadReset value) loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PersonalDetailsEventLoadDetails value)? loadDetails,
    TResult? Function(PersonalDetailsEventLoadReset value)? loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonalDetailsEventLoadDetails value)? loadDetails,
    TResult Function(PersonalDetailsEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalDetailsEventCopyWith<$Res> {
  factory $PersonalDetailsEventCopyWith(PersonalDetailsEvent value,
          $Res Function(PersonalDetailsEvent) then) =
      _$PersonalDetailsEventCopyWithImpl<$Res, PersonalDetailsEvent>;
}

/// @nodoc
class _$PersonalDetailsEventCopyWithImpl<$Res,
        $Val extends PersonalDetailsEvent>
    implements $PersonalDetailsEventCopyWith<$Res> {
  _$PersonalDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PersonalDetailsEventLoadDetailsCopyWith<$Res> {
  factory _$$PersonalDetailsEventLoadDetailsCopyWith(
          _$PersonalDetailsEventLoadDetails value,
          $Res Function(_$PersonalDetailsEventLoadDetails) then) =
      __$$PersonalDetailsEventLoadDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$PersonalDetailsEventLoadDetailsCopyWithImpl<$Res>
    extends _$PersonalDetailsEventCopyWithImpl<$Res,
        _$PersonalDetailsEventLoadDetails>
    implements _$$PersonalDetailsEventLoadDetailsCopyWith<$Res> {
  __$$PersonalDetailsEventLoadDetailsCopyWithImpl(
      _$PersonalDetailsEventLoadDetails _value,
      $Res Function(_$PersonalDetailsEventLoadDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$PersonalDetailsEventLoadDetails(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PersonalDetailsEventLoadDetails
    implements PersonalDetailsEventLoadDetails {
  _$PersonalDetailsEventLoadDetails({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'PersonalDetailsEvent.loadDetails(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalDetailsEventLoadDetails &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalDetailsEventLoadDetailsCopyWith<_$PersonalDetailsEventLoadDetails>
      get copyWith => __$$PersonalDetailsEventLoadDetailsCopyWithImpl<
          _$PersonalDetailsEventLoadDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadDetails,
    required TResult Function() loadReset,
  }) {
    return loadDetails(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadDetails,
    TResult? Function()? loadReset,
  }) {
    return loadDetails?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadDetails,
    TResult Function()? loadReset,
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
    required TResult Function(PersonalDetailsEventLoadDetails value)
        loadDetails,
    required TResult Function(PersonalDetailsEventLoadReset value) loadReset,
  }) {
    return loadDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PersonalDetailsEventLoadDetails value)? loadDetails,
    TResult? Function(PersonalDetailsEventLoadReset value)? loadReset,
  }) {
    return loadDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonalDetailsEventLoadDetails value)? loadDetails,
    TResult Function(PersonalDetailsEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadDetails != null) {
      return loadDetails(this);
    }
    return orElse();
  }
}

abstract class PersonalDetailsEventLoadDetails implements PersonalDetailsEvent {
  factory PersonalDetailsEventLoadDetails({required final String locale}) =
      _$PersonalDetailsEventLoadDetails;

  String get locale;
  @JsonKey(ignore: true)
  _$$PersonalDetailsEventLoadDetailsCopyWith<_$PersonalDetailsEventLoadDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PersonalDetailsEventLoadResetCopyWith<$Res> {
  factory _$$PersonalDetailsEventLoadResetCopyWith(
          _$PersonalDetailsEventLoadReset value,
          $Res Function(_$PersonalDetailsEventLoadReset) then) =
      __$$PersonalDetailsEventLoadResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PersonalDetailsEventLoadResetCopyWithImpl<$Res>
    extends _$PersonalDetailsEventCopyWithImpl<$Res,
        _$PersonalDetailsEventLoadReset>
    implements _$$PersonalDetailsEventLoadResetCopyWith<$Res> {
  __$$PersonalDetailsEventLoadResetCopyWithImpl(
      _$PersonalDetailsEventLoadReset _value,
      $Res Function(_$PersonalDetailsEventLoadReset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PersonalDetailsEventLoadReset implements PersonalDetailsEventLoadReset {
  _$PersonalDetailsEventLoadReset();

  @override
  String toString() {
    return 'PersonalDetailsEvent.loadReset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalDetailsEventLoadReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadDetails,
    required TResult Function() loadReset,
  }) {
    return loadReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadDetails,
    TResult? Function()? loadReset,
  }) {
    return loadReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadDetails,
    TResult Function()? loadReset,
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
    required TResult Function(PersonalDetailsEventLoadDetails value)
        loadDetails,
    required TResult Function(PersonalDetailsEventLoadReset value) loadReset,
  }) {
    return loadReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PersonalDetailsEventLoadDetails value)? loadDetails,
    TResult? Function(PersonalDetailsEventLoadReset value)? loadReset,
  }) {
    return loadReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonalDetailsEventLoadDetails value)? loadDetails,
    TResult Function(PersonalDetailsEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadReset != null) {
      return loadReset(this);
    }
    return orElse();
  }
}

abstract class PersonalDetailsEventLoadReset implements PersonalDetailsEvent {
  factory PersonalDetailsEventLoadReset() = _$PersonalDetailsEventLoadReset;
}
