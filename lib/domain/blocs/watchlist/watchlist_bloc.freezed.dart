// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WatchlistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadMovies,
    required TResult Function(String locale) loadTV,
    required TResult Function() loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadMovies,
    TResult? Function(String locale)? loadTV,
    TResult? Function()? loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadMovies,
    TResult Function(String locale)? loadTV,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatchlistEventLoadMovies value) loadMovies,
    required TResult Function(WatchlistEventLoadTV value) loadTV,
    required TResult Function(WatchlistEventLoadReset value) loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WatchlistEventLoadMovies value)? loadMovies,
    TResult? Function(WatchlistEventLoadTV value)? loadTV,
    TResult? Function(WatchlistEventLoadReset value)? loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatchlistEventLoadMovies value)? loadMovies,
    TResult Function(WatchlistEventLoadTV value)? loadTV,
    TResult Function(WatchlistEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistEventCopyWith<$Res> {
  factory $WatchlistEventCopyWith(
          WatchlistEvent value, $Res Function(WatchlistEvent) then) =
      _$WatchlistEventCopyWithImpl<$Res, WatchlistEvent>;
}

/// @nodoc
class _$WatchlistEventCopyWithImpl<$Res, $Val extends WatchlistEvent>
    implements $WatchlistEventCopyWith<$Res> {
  _$WatchlistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WatchlistEventLoadMoviesCopyWith<$Res> {
  factory _$$WatchlistEventLoadMoviesCopyWith(_$WatchlistEventLoadMovies value,
          $Res Function(_$WatchlistEventLoadMovies) then) =
      __$$WatchlistEventLoadMoviesCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$WatchlistEventLoadMoviesCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$WatchlistEventLoadMovies>
    implements _$$WatchlistEventLoadMoviesCopyWith<$Res> {
  __$$WatchlistEventLoadMoviesCopyWithImpl(_$WatchlistEventLoadMovies _value,
      $Res Function(_$WatchlistEventLoadMovies) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$WatchlistEventLoadMovies(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WatchlistEventLoadMovies implements WatchlistEventLoadMovies {
  _$WatchlistEventLoadMovies({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'WatchlistEvent.loadMovies(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistEventLoadMovies &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistEventLoadMoviesCopyWith<_$WatchlistEventLoadMovies>
      get copyWith =>
          __$$WatchlistEventLoadMoviesCopyWithImpl<_$WatchlistEventLoadMovies>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadMovies,
    required TResult Function(String locale) loadTV,
    required TResult Function() loadReset,
  }) {
    return loadMovies(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadMovies,
    TResult? Function(String locale)? loadTV,
    TResult? Function()? loadReset,
  }) {
    return loadMovies?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadMovies,
    TResult Function(String locale)? loadTV,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) {
    if (loadMovies != null) {
      return loadMovies(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatchlistEventLoadMovies value) loadMovies,
    required TResult Function(WatchlistEventLoadTV value) loadTV,
    required TResult Function(WatchlistEventLoadReset value) loadReset,
  }) {
    return loadMovies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WatchlistEventLoadMovies value)? loadMovies,
    TResult? Function(WatchlistEventLoadTV value)? loadTV,
    TResult? Function(WatchlistEventLoadReset value)? loadReset,
  }) {
    return loadMovies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatchlistEventLoadMovies value)? loadMovies,
    TResult Function(WatchlistEventLoadTV value)? loadTV,
    TResult Function(WatchlistEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadMovies != null) {
      return loadMovies(this);
    }
    return orElse();
  }
}

abstract class WatchlistEventLoadMovies implements WatchlistEvent {
  factory WatchlistEventLoadMovies({required final String locale}) =
      _$WatchlistEventLoadMovies;

  String get locale;
  @JsonKey(ignore: true)
  _$$WatchlistEventLoadMoviesCopyWith<_$WatchlistEventLoadMovies>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WatchlistEventLoadTVCopyWith<$Res> {
  factory _$$WatchlistEventLoadTVCopyWith(_$WatchlistEventLoadTV value,
          $Res Function(_$WatchlistEventLoadTV) then) =
      __$$WatchlistEventLoadTVCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$WatchlistEventLoadTVCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$WatchlistEventLoadTV>
    implements _$$WatchlistEventLoadTVCopyWith<$Res> {
  __$$WatchlistEventLoadTVCopyWithImpl(_$WatchlistEventLoadTV _value,
      $Res Function(_$WatchlistEventLoadTV) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$WatchlistEventLoadTV(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WatchlistEventLoadTV implements WatchlistEventLoadTV {
  _$WatchlistEventLoadTV({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'WatchlistEvent.loadTV(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistEventLoadTV &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistEventLoadTVCopyWith<_$WatchlistEventLoadTV> get copyWith =>
      __$$WatchlistEventLoadTVCopyWithImpl<_$WatchlistEventLoadTV>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadMovies,
    required TResult Function(String locale) loadTV,
    required TResult Function() loadReset,
  }) {
    return loadTV(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadMovies,
    TResult? Function(String locale)? loadTV,
    TResult? Function()? loadReset,
  }) {
    return loadTV?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadMovies,
    TResult Function(String locale)? loadTV,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) {
    if (loadTV != null) {
      return loadTV(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatchlistEventLoadMovies value) loadMovies,
    required TResult Function(WatchlistEventLoadTV value) loadTV,
    required TResult Function(WatchlistEventLoadReset value) loadReset,
  }) {
    return loadTV(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WatchlistEventLoadMovies value)? loadMovies,
    TResult? Function(WatchlistEventLoadTV value)? loadTV,
    TResult? Function(WatchlistEventLoadReset value)? loadReset,
  }) {
    return loadTV?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatchlistEventLoadMovies value)? loadMovies,
    TResult Function(WatchlistEventLoadTV value)? loadTV,
    TResult Function(WatchlistEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadTV != null) {
      return loadTV(this);
    }
    return orElse();
  }
}

abstract class WatchlistEventLoadTV implements WatchlistEvent {
  factory WatchlistEventLoadTV({required final String locale}) =
      _$WatchlistEventLoadTV;

  String get locale;
  @JsonKey(ignore: true)
  _$$WatchlistEventLoadTVCopyWith<_$WatchlistEventLoadTV> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WatchlistEventLoadResetCopyWith<$Res> {
  factory _$$WatchlistEventLoadResetCopyWith(_$WatchlistEventLoadReset value,
          $Res Function(_$WatchlistEventLoadReset) then) =
      __$$WatchlistEventLoadResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WatchlistEventLoadResetCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$WatchlistEventLoadReset>
    implements _$$WatchlistEventLoadResetCopyWith<$Res> {
  __$$WatchlistEventLoadResetCopyWithImpl(_$WatchlistEventLoadReset _value,
      $Res Function(_$WatchlistEventLoadReset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WatchlistEventLoadReset implements WatchlistEventLoadReset {
  _$WatchlistEventLoadReset();

  @override
  String toString() {
    return 'WatchlistEvent.loadReset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistEventLoadReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadMovies,
    required TResult Function(String locale) loadTV,
    required TResult Function() loadReset,
  }) {
    return loadReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadMovies,
    TResult? Function(String locale)? loadTV,
    TResult? Function()? loadReset,
  }) {
    return loadReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadMovies,
    TResult Function(String locale)? loadTV,
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
    required TResult Function(WatchlistEventLoadMovies value) loadMovies,
    required TResult Function(WatchlistEventLoadTV value) loadTV,
    required TResult Function(WatchlistEventLoadReset value) loadReset,
  }) {
    return loadReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WatchlistEventLoadMovies value)? loadMovies,
    TResult? Function(WatchlistEventLoadTV value)? loadTV,
    TResult? Function(WatchlistEventLoadReset value)? loadReset,
  }) {
    return loadReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatchlistEventLoadMovies value)? loadMovies,
    TResult Function(WatchlistEventLoadTV value)? loadTV,
    TResult Function(WatchlistEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadReset != null) {
      return loadReset(this);
    }
    return orElse();
  }
}

abstract class WatchlistEventLoadReset implements WatchlistEvent {
  factory WatchlistEventLoadReset() = _$WatchlistEventLoadReset;
}
