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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrendingListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function(String locale) loadPeopleThisWeek,
    required TResult Function() loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadAllThisWeek,
    TResult? Function(String locale)? loadMoviesThisWeek,
    TResult? Function(String locale)? loadTvThisWeek,
    TResult? Function(String locale)? loadPeopleThisWeek,
    TResult? Function()? loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadAllThisWeek,
    TResult Function(String locale)? loadMoviesThisWeek,
    TResult Function(String locale)? loadTvThisWeek,
    TResult Function(String locale)? loadPeopleThisWeek,
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
    required TResult Function(TrendingListEvenLoadPeopleThisWeek value)
        loadPeopleThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult? Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult? Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult? Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
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
abstract class _$$TrendingListEventLoadAllThisWeekCopyWith<$Res> {
  factory _$$TrendingListEventLoadAllThisWeekCopyWith(
          _$TrendingListEventLoadAllThisWeek value,
          $Res Function(_$TrendingListEventLoadAllThisWeek) then) =
      __$$TrendingListEventLoadAllThisWeekCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TrendingListEventLoadAllThisWeekCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res,
        _$TrendingListEventLoadAllThisWeek>
    implements _$$TrendingListEventLoadAllThisWeekCopyWith<$Res> {
  __$$TrendingListEventLoadAllThisWeekCopyWithImpl(
      _$TrendingListEventLoadAllThisWeek _value,
      $Res Function(_$TrendingListEventLoadAllThisWeek) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TrendingListEventLoadAllThisWeek(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrendingListEventLoadAllThisWeek
    implements TrendingListEventLoadAllThisWeek {
  _$TrendingListEventLoadAllThisWeek({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TrendingListEvent.loadAllThisWeek(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEventLoadAllThisWeek &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingListEventLoadAllThisWeekCopyWith<
          _$TrendingListEventLoadAllThisWeek>
      get copyWith => __$$TrendingListEventLoadAllThisWeekCopyWithImpl<
          _$TrendingListEventLoadAllThisWeek>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function(String locale) loadPeopleThisWeek,
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
    TResult? Function(String locale)? loadPeopleThisWeek,
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
    TResult Function(String locale)? loadPeopleThisWeek,
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
    required TResult Function(TrendingListEvenLoadPeopleThisWeek value)
        loadPeopleThisWeek,
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
    TResult? Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
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
    TResult Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
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
      _$TrendingListEventLoadAllThisWeek;

  String get locale;
  @JsonKey(ignore: true)
  _$$TrendingListEventLoadAllThisWeekCopyWith<
          _$TrendingListEventLoadAllThisWeek>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrendingListEventLoadMoviesThisWeekCopyWith<$Res> {
  factory _$$TrendingListEventLoadMoviesThisWeekCopyWith(
          _$TrendingListEventLoadMoviesThisWeek value,
          $Res Function(_$TrendingListEventLoadMoviesThisWeek) then) =
      __$$TrendingListEventLoadMoviesThisWeekCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TrendingListEventLoadMoviesThisWeekCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res,
        _$TrendingListEventLoadMoviesThisWeek>
    implements _$$TrendingListEventLoadMoviesThisWeekCopyWith<$Res> {
  __$$TrendingListEventLoadMoviesThisWeekCopyWithImpl(
      _$TrendingListEventLoadMoviesThisWeek _value,
      $Res Function(_$TrendingListEventLoadMoviesThisWeek) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TrendingListEventLoadMoviesThisWeek(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrendingListEventLoadMoviesThisWeek
    implements TrendingListEventLoadMoviesThisWeek {
  _$TrendingListEventLoadMoviesThisWeek({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TrendingListEvent.loadMoviesThisWeek(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEventLoadMoviesThisWeek &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingListEventLoadMoviesThisWeekCopyWith<
          _$TrendingListEventLoadMoviesThisWeek>
      get copyWith => __$$TrendingListEventLoadMoviesThisWeekCopyWithImpl<
          _$TrendingListEventLoadMoviesThisWeek>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function(String locale) loadPeopleThisWeek,
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
    TResult? Function(String locale)? loadPeopleThisWeek,
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
    TResult Function(String locale)? loadPeopleThisWeek,
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
    required TResult Function(TrendingListEvenLoadPeopleThisWeek value)
        loadPeopleThisWeek,
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
    TResult? Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
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
    TResult Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
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
      _$TrendingListEventLoadMoviesThisWeek;

  String get locale;
  @JsonKey(ignore: true)
  _$$TrendingListEventLoadMoviesThisWeekCopyWith<
          _$TrendingListEventLoadMoviesThisWeek>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrendingListEventLoadTvThisWeekCopyWith<$Res> {
  factory _$$TrendingListEventLoadTvThisWeekCopyWith(
          _$TrendingListEventLoadTvThisWeek value,
          $Res Function(_$TrendingListEventLoadTvThisWeek) then) =
      __$$TrendingListEventLoadTvThisWeekCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TrendingListEventLoadTvThisWeekCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res,
        _$TrendingListEventLoadTvThisWeek>
    implements _$$TrendingListEventLoadTvThisWeekCopyWith<$Res> {
  __$$TrendingListEventLoadTvThisWeekCopyWithImpl(
      _$TrendingListEventLoadTvThisWeek _value,
      $Res Function(_$TrendingListEventLoadTvThisWeek) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TrendingListEventLoadTvThisWeek(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrendingListEventLoadTvThisWeek
    implements TrendingListEventLoadTvThisWeek {
  _$TrendingListEventLoadTvThisWeek({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TrendingListEvent.loadTvThisWeek(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEventLoadTvThisWeek &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingListEventLoadTvThisWeekCopyWith<_$TrendingListEventLoadTvThisWeek>
      get copyWith => __$$TrendingListEventLoadTvThisWeekCopyWithImpl<
          _$TrendingListEventLoadTvThisWeek>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function(String locale) loadPeopleThisWeek,
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
    TResult? Function(String locale)? loadPeopleThisWeek,
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
    TResult Function(String locale)? loadPeopleThisWeek,
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
    required TResult Function(TrendingListEvenLoadPeopleThisWeek value)
        loadPeopleThisWeek,
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
    TResult? Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
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
    TResult Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
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
      _$TrendingListEventLoadTvThisWeek;

  String get locale;
  @JsonKey(ignore: true)
  _$$TrendingListEventLoadTvThisWeekCopyWith<_$TrendingListEventLoadTvThisWeek>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrendingListEvenLoadPeopleThisWeekCopyWith<$Res> {
  factory _$$TrendingListEvenLoadPeopleThisWeekCopyWith(
          _$TrendingListEvenLoadPeopleThisWeek value,
          $Res Function(_$TrendingListEvenLoadPeopleThisWeek) then) =
      __$$TrendingListEvenLoadPeopleThisWeekCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TrendingListEvenLoadPeopleThisWeekCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res,
        _$TrendingListEvenLoadPeopleThisWeek>
    implements _$$TrendingListEvenLoadPeopleThisWeekCopyWith<$Res> {
  __$$TrendingListEvenLoadPeopleThisWeekCopyWithImpl(
      _$TrendingListEvenLoadPeopleThisWeek _value,
      $Res Function(_$TrendingListEvenLoadPeopleThisWeek) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TrendingListEvenLoadPeopleThisWeek(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrendingListEvenLoadPeopleThisWeek
    implements TrendingListEvenLoadPeopleThisWeek {
  _$TrendingListEvenLoadPeopleThisWeek({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TrendingListEvent.loadPeopleThisWeek(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEvenLoadPeopleThisWeek &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingListEvenLoadPeopleThisWeekCopyWith<
          _$TrendingListEvenLoadPeopleThisWeek>
      get copyWith => __$$TrendingListEvenLoadPeopleThisWeekCopyWithImpl<
          _$TrendingListEvenLoadPeopleThisWeek>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function(String locale) loadPeopleThisWeek,
    required TResult Function() loadReset,
  }) {
    return loadPeopleThisWeek(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadAllThisWeek,
    TResult? Function(String locale)? loadMoviesThisWeek,
    TResult? Function(String locale)? loadTvThisWeek,
    TResult? Function(String locale)? loadPeopleThisWeek,
    TResult? Function()? loadReset,
  }) {
    return loadPeopleThisWeek?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadAllThisWeek,
    TResult Function(String locale)? loadMoviesThisWeek,
    TResult Function(String locale)? loadTvThisWeek,
    TResult Function(String locale)? loadPeopleThisWeek,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) {
    if (loadPeopleThisWeek != null) {
      return loadPeopleThisWeek(locale);
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
    required TResult Function(TrendingListEvenLoadPeopleThisWeek value)
        loadPeopleThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) {
    return loadPeopleThisWeek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult? Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult? Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult? Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) {
    return loadPeopleThisWeek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadAllThisWeek value)? loadAllThisWeek,
    TResult Function(TrendingListEventLoadMoviesThisWeek value)?
        loadMoviesThisWeek,
    TResult Function(TrendingListEventLoadTvThisWeek value)? loadTvThisWeek,
    TResult Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
    TResult Function(TrendingListEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadPeopleThisWeek != null) {
      return loadPeopleThisWeek(this);
    }
    return orElse();
  }
}

abstract class TrendingListEvenLoadPeopleThisWeek implements TrendingListEvent {
  factory TrendingListEvenLoadPeopleThisWeek({required final String locale}) =
      _$TrendingListEvenLoadPeopleThisWeek;

  String get locale;
  @JsonKey(ignore: true)
  _$$TrendingListEvenLoadPeopleThisWeekCopyWith<
          _$TrendingListEvenLoadPeopleThisWeek>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrendingListEventLoadResetCopyWith<$Res> {
  factory _$$TrendingListEventLoadResetCopyWith(
          _$TrendingListEventLoadReset value,
          $Res Function(_$TrendingListEventLoadReset) then) =
      __$$TrendingListEventLoadResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TrendingListEventLoadResetCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res, _$TrendingListEventLoadReset>
    implements _$$TrendingListEventLoadResetCopyWith<$Res> {
  __$$TrendingListEventLoadResetCopyWithImpl(
      _$TrendingListEventLoadReset _value,
      $Res Function(_$TrendingListEventLoadReset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TrendingListEventLoadReset implements TrendingListEventLoadReset {
  _$TrendingListEventLoadReset();

  @override
  String toString() {
    return 'TrendingListEvent.loadReset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEventLoadReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadAllThisWeek,
    required TResult Function(String locale) loadMoviesThisWeek,
    required TResult Function(String locale) loadTvThisWeek,
    required TResult Function(String locale) loadPeopleThisWeek,
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
    TResult? Function(String locale)? loadPeopleThisWeek,
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
    TResult Function(String locale)? loadPeopleThisWeek,
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
    required TResult Function(TrendingListEvenLoadPeopleThisWeek value)
        loadPeopleThisWeek,
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
    TResult? Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
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
    TResult Function(TrendingListEvenLoadPeopleThisWeek value)?
        loadPeopleThisWeek,
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
  factory TrendingListEventLoadReset() = _$TrendingListEventLoadReset;
}
