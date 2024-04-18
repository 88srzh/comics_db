// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrendingListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function() loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadAllThisWeek,
    TResult? Function(String locale)? loadMoviesThisWeek,
    TResult? Function(String locale)? loadTvThisWeek,
    TResult? Function()? loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadAllThisWeek,
    TResult Function(String locale)? loadMoviesThisWeek,
    TResult Function(String locale)? loadTvThisWeek,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendingListEventLoadAllThisWeek value)
        loadAllThisWeek,
    required TResult Function(TrendingListEventLoadMoviesThisWeek value)
        loadMoviesThisWeek,
    required TResult Function(TrendingListEventLoadTvThisWeek value)
        loadTvThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult? Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult? Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult Function(TrendingListEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingListEventCopyWith<$Res> {
  factory $TrendingListEventCopyWith(
          TrendingListEvent value, $Res Function(TrendingListEvent) then) =
      _$TrendingListEventCopyWithImpl<$Res, TrendingListEvent>;
}

/// @nodoc
class _$TrendingListEventCopyWithImpl<$Res, $Val extends TrendingListEvent>
    implements $TrendingListEventCopyWith<$Res> {
  _$TrendingListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TrendingListEventLoadAllThisWeekImplCopyWith<$Res> {
  factory _$$TrendingListEventLoadAllThisWeekImplCopyWith(
          _$TrendingListEventLoadAllThisWeekImpl value,
          $Res Function(_$TrendingListEventLoadAllThisWeekImpl) then) =
      __$$TrendingListEventLoadAllThisWeekImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TrendingListEventLoadAllThisWeekImplCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res,
        _$TrendingListEventLoadAllThisWeekImpl>
    implements _$$TrendingListEventLoadAllThisWeekImplCopyWith<$Res> {
  __$$TrendingListEventLoadAllThisWeekImplCopyWithImpl(
      _$TrendingListEventLoadAllThisWeekImpl _value,
      $Res Function(_$TrendingListEventLoadAllThisWeekImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TrendingListEventLoadAllThisWeekImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrendingListEventLoadAllThisWeekImpl
    implements TrendingListEventLoadAllThisWeek {
  _$TrendingListEventLoadAllThisWeekImpl({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TrendingListEvent.loadAllThisWeek(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEventLoadAllThisWeekImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingListEventLoadAllThisWeekImplCopyWith<
          _$TrendingListEventLoadAllThisWeekImpl>
      get copyWith => __$$TrendingListEventLoadAllThisWeekImplCopyWithImpl<
          _$TrendingListEventLoadAllThisWeekImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function() loadReset,
  }) {
    return loadAllThisWeek(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadAllThisWeek,
    TResult? Function(String locale)? loadMoviesThisWeek,
    TResult? Function(String locale)? loadTvThisWeek,
    TResult? Function()? loadReset,
  }) {
    return loadAllThisWeek?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadAllThisWeek,
    TResult Function(String locale)? loadMoviesThisWeek,
    TResult Function(String locale)? loadTvThisWeek,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) {
    if (loadAllThisWeek != null) {
      return loadAllThisWeek(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendingListEventLoadAllThisWeek value)
        loadAllThisWeek,
    required TResult Function(TrendingListEventLoadMoviesThisWeek value)
        loadMoviesThisWeek,
    required TResult Function(TrendingListEventLoadTvThisWeek value)
        loadTvThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) {
    return loadAllThisWeek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult? Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult? Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) {
    return loadAllThisWeek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult Function(TrendingListEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadAllThisWeek != null) {
      return loadAllThisWeek(this);
    }
    return orElse();
  }
}

abstract class TrendingListEventLoadAllThisWeek implements TrendingListEvent {
  factory TrendingListEventLoadAllThisWeek({required final String locale}) =
      _$TrendingListEventLoadAllThisWeekImpl;

  String get locale;
  @JsonKey(ignore: true)
  _$$TrendingListEventLoadAllThisWeekImplCopyWith<
          _$TrendingListEventLoadAllThisWeekImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrendingListEventLoadMoviesThisWeekImplCopyWith<$Res> {
  factory _$$TrendingListEventLoadMoviesThisWeekImplCopyWith(
          _$TrendingListEventLoadMoviesThisWeekImpl value,
          $Res Function(_$TrendingListEventLoadMoviesThisWeekImpl) then) =
      __$$TrendingListEventLoadMoviesThisWeekImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TrendingListEventLoadMoviesThisWeekImplCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res,
        _$TrendingListEventLoadMoviesThisWeekImpl>
    implements _$$TrendingListEventLoadMoviesThisWeekImplCopyWith<$Res> {
  __$$TrendingListEventLoadMoviesThisWeekImplCopyWithImpl(
      _$TrendingListEventLoadMoviesThisWeekImpl _value,
      $Res Function(_$TrendingListEventLoadMoviesThisWeekImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TrendingListEventLoadMoviesThisWeekImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrendingListEventLoadMoviesThisWeekImpl
    implements TrendingListEventLoadMoviesThisWeek {
  _$TrendingListEventLoadMoviesThisWeekImpl({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TrendingListEvent.loadMoviesThisWeek(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEventLoadMoviesThisWeekImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingListEventLoadMoviesThisWeekImplCopyWith<
          _$TrendingListEventLoadMoviesThisWeekImpl>
      get copyWith => __$$TrendingListEventLoadMoviesThisWeekImplCopyWithImpl<
          _$TrendingListEventLoadMoviesThisWeekImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function() loadReset,
  }) {
    return loadMoviesThisWeek(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadAllThisWeek,
    TResult? Function(String locale)? loadMoviesThisWeek,
    TResult? Function(String locale)? loadTvThisWeek,
    TResult? Function()? loadReset,
  }) {
    return loadMoviesThisWeek?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadAllThisWeek,
    TResult Function(String locale)? loadMoviesThisWeek,
    TResult Function(String locale)? loadTvThisWeek,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) {
    if (loadMoviesThisWeek != null) {
      return loadMoviesThisWeek(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendingListEventLoadAllThisWeek value)
        loadAllThisWeek,
    required TResult Function(TrendingListEventLoadMoviesThisWeek value)
        loadMoviesThisWeek,
    required TResult Function(TrendingListEventLoadTvThisWeek value)
        loadTvThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) {
    return loadMoviesThisWeek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult? Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult? Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) {
    return loadMoviesThisWeek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult Function(TrendingListEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadMoviesThisWeek != null) {
      return loadMoviesThisWeek(this);
    }
    return orElse();
  }
}

abstract class TrendingListEventLoadMoviesThisWeek
    implements TrendingListEvent {
  factory TrendingListEventLoadMoviesThisWeek({required final String locale}) =
      _$TrendingListEventLoadMoviesThisWeekImpl;

  String get locale;
  @JsonKey(ignore: true)
  _$$TrendingListEventLoadMoviesThisWeekImplCopyWith<
          _$TrendingListEventLoadMoviesThisWeekImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrendingListEventLoadTvThisWeekImplCopyWith<$Res> {
  factory _$$TrendingListEventLoadTvThisWeekImplCopyWith(
          _$TrendingListEventLoadTvThisWeekImpl value,
          $Res Function(_$TrendingListEventLoadTvThisWeekImpl) then) =
      __$$TrendingListEventLoadTvThisWeekImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TrendingListEventLoadTvThisWeekImplCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res,
        _$TrendingListEventLoadTvThisWeekImpl>
    implements _$$TrendingListEventLoadTvThisWeekImplCopyWith<$Res> {
  __$$TrendingListEventLoadTvThisWeekImplCopyWithImpl(
      _$TrendingListEventLoadTvThisWeekImpl _value,
      $Res Function(_$TrendingListEventLoadTvThisWeekImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TrendingListEventLoadTvThisWeekImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrendingListEventLoadTvThisWeekImpl
    implements TrendingListEventLoadTvThisWeek {
  _$TrendingListEventLoadTvThisWeekImpl({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TrendingListEvent.loadTvThisWeek(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEventLoadTvThisWeekImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingListEventLoadTvThisWeekImplCopyWith<
          _$TrendingListEventLoadTvThisWeekImpl>
      get copyWith => __$$TrendingListEventLoadTvThisWeekImplCopyWithImpl<
          _$TrendingListEventLoadTvThisWeekImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function() loadReset,
  }) {
    return loadTvThisWeek(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadAllThisWeek,
    TResult? Function(String locale)? loadMoviesThisWeek,
    TResult? Function(String locale)? loadTvThisWeek,
    TResult? Function()? loadReset,
  }) {
    return loadTvThisWeek?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadAllThisWeek,
    TResult Function(String locale)? loadMoviesThisWeek,
    TResult Function(String locale)? loadTvThisWeek,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) {
    if (loadTvThisWeek != null) {
      return loadTvThisWeek(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendingListEventLoadAllThisWeek value)
        loadAllThisWeek,
    required TResult Function(TrendingListEventLoadMoviesThisWeek value)
        loadMoviesThisWeek,
    required TResult Function(TrendingListEventLoadTvThisWeek value)
        loadTvThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) {
    return loadTvThisWeek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult? Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult? Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) {
    return loadTvThisWeek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult Function(TrendingListEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadTvThisWeek != null) {
      return loadTvThisWeek(this);
    }
    return orElse();
  }
}

abstract class TrendingListEventLoadTvThisWeek implements TrendingListEvent {
  factory TrendingListEventLoadTvThisWeek({required final String locale}) =
      _$TrendingListEventLoadTvThisWeekImpl;

  String get locale;
  @JsonKey(ignore: true)
  _$$TrendingListEventLoadTvThisWeekImplCopyWith<
          _$TrendingListEventLoadTvThisWeekImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrendingListEventLoadResetImplCopyWith<$Res> {
  factory _$$TrendingListEventLoadResetImplCopyWith(
          _$TrendingListEventLoadResetImpl value,
          $Res Function(_$TrendingListEventLoadResetImpl) then) =
      __$$TrendingListEventLoadResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TrendingListEventLoadResetImplCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res,
        _$TrendingListEventLoadResetImpl>
    implements _$$TrendingListEventLoadResetImplCopyWith<$Res> {
  __$$TrendingListEventLoadResetImplCopyWithImpl(
      _$TrendingListEventLoadResetImpl _value,
      $Res Function(_$TrendingListEventLoadResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TrendingListEventLoadResetImpl implements TrendingListEventLoadReset {
  _$TrendingListEventLoadResetImpl();

  @override
  String toString() {
    return 'TrendingListEvent.loadReset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEventLoadResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function() loadReset,
  }) {
    return loadReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadAllThisWeek,
    TResult? Function(String locale)? loadMoviesThisWeek,
    TResult? Function(String locale)? loadTvThisWeek,
    TResult? Function()? loadReset,
  }) {
    return loadReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadAllThisWeek,
    TResult Function(String locale)? loadMoviesThisWeek,
    TResult Function(String locale)? loadTvThisWeek,
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
    required TResult Function(TrendingListEventLoadAllThisWeek value)
        loadAllThisWeek,
    required TResult Function(TrendingListEventLoadMoviesThisWeek value)
        loadMoviesThisWeek,
    required TResult Function(TrendingListEventLoadTvThisWeek value)
        loadTvThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) {
    return loadReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult? Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult? Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) {
    return loadReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult Function(TrendingListEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadReset != null) {
      return loadReset(this);
    }
    return orElse();
  }
}

abstract class TrendingListEventLoadReset implements TrendingListEvent {
  factory TrendingListEventLoadReset() = _$TrendingListEventLoadResetImpl;
}
