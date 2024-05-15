// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_season_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TvSeasonEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale, int seasonNumber) loadNextPage,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale, int seasonNumber)? loadNextPage,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale, int seasonNumber)? loadNextPage,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TvSeasonEventLoadNextPage value) loadNextPage,
    required TResult Function(TvSeasonEventLoadReset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TvSeasonEventLoadNextPage value)? loadNextPage,
    TResult? Function(TvSeasonEventLoadReset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TvSeasonEventLoadNextPage value)? loadNextPage,
    TResult Function(TvSeasonEventLoadReset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeasonEventCopyWith<$Res> {
  factory $TvSeasonEventCopyWith(
          TvSeasonEvent value, $Res Function(TvSeasonEvent) then) =
      _$TvSeasonEventCopyWithImpl<$Res, TvSeasonEvent>;
}

/// @nodoc
class _$TvSeasonEventCopyWithImpl<$Res, $Val extends TvSeasonEvent>
    implements $TvSeasonEventCopyWith<$Res> {
  _$TvSeasonEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TvSeasonEventLoadNextPageImplCopyWith<$Res> {
  factory _$$TvSeasonEventLoadNextPageImplCopyWith(
          _$TvSeasonEventLoadNextPageImpl value,
          $Res Function(_$TvSeasonEventLoadNextPageImpl) then) =
      __$$TvSeasonEventLoadNextPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale, int seasonNumber});
}

/// @nodoc
class __$$TvSeasonEventLoadNextPageImplCopyWithImpl<$Res>
    extends _$TvSeasonEventCopyWithImpl<$Res, _$TvSeasonEventLoadNextPageImpl>
    implements _$$TvSeasonEventLoadNextPageImplCopyWith<$Res> {
  __$$TvSeasonEventLoadNextPageImplCopyWithImpl(
      _$TvSeasonEventLoadNextPageImpl _value,
      $Res Function(_$TvSeasonEventLoadNextPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? seasonNumber = null,
  }) {
    return _then(_$TvSeasonEventLoadNextPageImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TvSeasonEventLoadNextPageImpl implements TvSeasonEventLoadNextPage {
  const _$TvSeasonEventLoadNextPageImpl(
      {required this.locale, required this.seasonNumber});

  @override
  final String locale;
  @override
  final int seasonNumber;

  @override
  String toString() {
    return 'TvSeasonEvent.loadNextPage(locale: $locale, seasonNumber: $seasonNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvSeasonEventLoadNextPageImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, seasonNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvSeasonEventLoadNextPageImplCopyWith<_$TvSeasonEventLoadNextPageImpl>
      get copyWith => __$$TvSeasonEventLoadNextPageImplCopyWithImpl<
          _$TvSeasonEventLoadNextPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale, int seasonNumber) loadNextPage,
    required TResult Function() reset,
  }) {
    return loadNextPage(locale, seasonNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale, int seasonNumber)? loadNextPage,
    TResult? Function()? reset,
  }) {
    return loadNextPage?.call(locale, seasonNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale, int seasonNumber)? loadNextPage,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage(locale, seasonNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TvSeasonEventLoadNextPage value) loadNextPage,
    required TResult Function(TvSeasonEventLoadReset value) reset,
  }) {
    return loadNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TvSeasonEventLoadNextPage value)? loadNextPage,
    TResult? Function(TvSeasonEventLoadReset value)? reset,
  }) {
    return loadNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TvSeasonEventLoadNextPage value)? loadNextPage,
    TResult Function(TvSeasonEventLoadReset value)? reset,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage(this);
    }
    return orElse();
  }
}

abstract class TvSeasonEventLoadNextPage implements TvSeasonEvent {
  const factory TvSeasonEventLoadNextPage(
      {required final String locale,
      required final int seasonNumber}) = _$TvSeasonEventLoadNextPageImpl;

  String get locale;
  int get seasonNumber;
  @JsonKey(ignore: true)
  _$$TvSeasonEventLoadNextPageImplCopyWith<_$TvSeasonEventLoadNextPageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TvSeasonEventLoadResetImplCopyWith<$Res> {
  factory _$$TvSeasonEventLoadResetImplCopyWith(
          _$TvSeasonEventLoadResetImpl value,
          $Res Function(_$TvSeasonEventLoadResetImpl) then) =
      __$$TvSeasonEventLoadResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TvSeasonEventLoadResetImplCopyWithImpl<$Res>
    extends _$TvSeasonEventCopyWithImpl<$Res, _$TvSeasonEventLoadResetImpl>
    implements _$$TvSeasonEventLoadResetImplCopyWith<$Res> {
  __$$TvSeasonEventLoadResetImplCopyWithImpl(
      _$TvSeasonEventLoadResetImpl _value,
      $Res Function(_$TvSeasonEventLoadResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TvSeasonEventLoadResetImpl implements TvSeasonEventLoadReset {
  const _$TvSeasonEventLoadResetImpl();

  @override
  String toString() {
    return 'TvSeasonEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvSeasonEventLoadResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale, int seasonNumber) loadNextPage,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale, int seasonNumber)? loadNextPage,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale, int seasonNumber)? loadNextPage,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TvSeasonEventLoadNextPage value) loadNextPage,
    required TResult Function(TvSeasonEventLoadReset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TvSeasonEventLoadNextPage value)? loadNextPage,
    TResult? Function(TvSeasonEventLoadReset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TvSeasonEventLoadNextPage value)? loadNextPage,
    TResult Function(TvSeasonEventLoadReset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class TvSeasonEventLoadReset implements TvSeasonEvent {
  const factory TvSeasonEventLoadReset() = _$TvSeasonEventLoadResetImpl;
}
