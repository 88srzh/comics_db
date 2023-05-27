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
    required TResult Function(String locale) loadNextPage,
    required TResult Function(String locale) loadNextThisWeek,
    required TResult Function() loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function(String locale)? loadNextThisWeek,
    TResult? Function()? loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function(String locale)? loadNextThisWeek,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendingListEventLoadNextPage value) loadNextPage,
    required TResult Function(TrendingListEventLoadNextPageThisWweek value)
        loadNextThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadNextPage value)? loadNextPage,
    TResult? Function(TrendingListEventLoadNextPageThisWweek value)?
        loadNextThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadNextPage value)? loadNextPage,
    TResult Function(TrendingListEventLoadNextPageThisWweek value)?
        loadNextThisWeek,
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
abstract class _$$TrendingListEventLoadNextPageCopyWith<$Res> {
  factory _$$TrendingListEventLoadNextPageCopyWith(
          _$TrendingListEventLoadNextPage value,
          $Res Function(_$TrendingListEventLoadNextPage) then) =
      __$$TrendingListEventLoadNextPageCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TrendingListEventLoadNextPageCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res,
        _$TrendingListEventLoadNextPage>
    implements _$$TrendingListEventLoadNextPageCopyWith<$Res> {
  __$$TrendingListEventLoadNextPageCopyWithImpl(
      _$TrendingListEventLoadNextPage _value,
      $Res Function(_$TrendingListEventLoadNextPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TrendingListEventLoadNextPage(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrendingListEventLoadNextPage implements TrendingListEventLoadNextPage {
  _$TrendingListEventLoadNextPage({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TrendingListEvent.loadNextPage(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEventLoadNextPage &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingListEventLoadNextPageCopyWith<_$TrendingListEventLoadNextPage>
      get copyWith => __$$TrendingListEventLoadNextPageCopyWithImpl<
          _$TrendingListEventLoadNextPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function(String locale) loadNextThisWeek,
    required TResult Function() loadReset,
  }) {
    return loadNextPage(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function(String locale)? loadNextThisWeek,
    TResult? Function()? loadReset,
  }) {
    return loadNextPage?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function(String locale)? loadNextThisWeek,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendingListEventLoadNextPage value) loadNextPage,
    required TResult Function(TrendingListEventLoadNextPageThisWweek value)
        loadNextThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) {
    return loadNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadNextPage value)? loadNextPage,
    TResult? Function(TrendingListEventLoadNextPageThisWweek value)?
        loadNextThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) {
    return loadNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadNextPage value)? loadNextPage,
    TResult Function(TrendingListEventLoadNextPageThisWweek value)?
        loadNextThisWeek,
    TResult Function(TrendingListEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage(this);
    }
    return orElse();
  }
}

abstract class TrendingListEventLoadNextPage implements TrendingListEvent {
  factory TrendingListEventLoadNextPage({required final String locale}) =
      _$TrendingListEventLoadNextPage;

  String get locale;
  @JsonKey(ignore: true)
  _$$TrendingListEventLoadNextPageCopyWith<_$TrendingListEventLoadNextPage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrendingListEventLoadNextPageThisWweekCopyWith<$Res> {
  factory _$$TrendingListEventLoadNextPageThisWweekCopyWith(
          _$TrendingListEventLoadNextPageThisWweek value,
          $Res Function(_$TrendingListEventLoadNextPageThisWweek) then) =
      __$$TrendingListEventLoadNextPageThisWweekCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TrendingListEventLoadNextPageThisWweekCopyWithImpl<$Res>
    extends _$TrendingListEventCopyWithImpl<$Res,
        _$TrendingListEventLoadNextPageThisWweek>
    implements _$$TrendingListEventLoadNextPageThisWweekCopyWith<$Res> {
  __$$TrendingListEventLoadNextPageThisWweekCopyWithImpl(
      _$TrendingListEventLoadNextPageThisWweek _value,
      $Res Function(_$TrendingListEventLoadNextPageThisWweek) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TrendingListEventLoadNextPageThisWweek(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrendingListEventLoadNextPageThisWweek
    implements TrendingListEventLoadNextPageThisWweek {
  _$TrendingListEventLoadNextPageThisWweek({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TrendingListEvent.loadNextThisWeek(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListEventLoadNextPageThisWweek &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingListEventLoadNextPageThisWweekCopyWith<
          _$TrendingListEventLoadNextPageThisWweek>
      get copyWith => __$$TrendingListEventLoadNextPageThisWweekCopyWithImpl<
          _$TrendingListEventLoadNextPageThisWweek>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function(String locale) loadNextThisWeek,
    required TResult Function() loadReset,
  }) {
    return loadNextThisWeek(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function(String locale)? loadNextThisWeek,
    TResult? Function()? loadReset,
  }) {
    return loadNextThisWeek?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function(String locale)? loadNextThisWeek,
    TResult Function()? loadReset,
    required TResult orElse(),
  }) {
    if (loadNextThisWeek != null) {
      return loadNextThisWeek(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendingListEventLoadNextPage value) loadNextPage,
    required TResult Function(TrendingListEventLoadNextPageThisWweek value)
        loadNextThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) {
    return loadNextThisWeek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadNextPage value)? loadNextPage,
    TResult? Function(TrendingListEventLoadNextPageThisWweek value)?
        loadNextThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) {
    return loadNextThisWeek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadNextPage value)? loadNextPage,
    TResult Function(TrendingListEventLoadNextPageThisWweek value)?
        loadNextThisWeek,
    TResult Function(TrendingListEventLoadReset value)? loadReset,
    required TResult orElse(),
  }) {
    if (loadNextThisWeek != null) {
      return loadNextThisWeek(this);
    }
    return orElse();
  }
}

abstract class TrendingListEventLoadNextPageThisWweek
    implements TrendingListEvent {
  factory TrendingListEventLoadNextPageThisWweek(
          {required final String locale}) =
      _$TrendingListEventLoadNextPageThisWweek;

  String get locale;
  @JsonKey(ignore: true)
  _$$TrendingListEventLoadNextPageThisWweekCopyWith<
          _$TrendingListEventLoadNextPageThisWweek>
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
    required TResult Function(String locale) loadNextPage,
    required TResult Function(String locale) loadNextThisWeek,
    required TResult Function() loadReset,
  }) {
    return loadReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function(String locale)? loadNextThisWeek,
    TResult? Function()? loadReset,
  }) {
    return loadReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function(String locale)? loadNextThisWeek,
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
    required TResult Function(TrendingListEventLoadNextPage value) loadNextPage,
    required TResult Function(TrendingListEventLoadNextPageThisWweek value)
        loadNextThisWeek,
    required TResult Function(TrendingListEventLoadReset value) loadReset,
  }) {
    return loadReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendingListEventLoadNextPage value)? loadNextPage,
    TResult? Function(TrendingListEventLoadNextPageThisWweek value)?
        loadNextThisWeek,
    TResult? Function(TrendingListEventLoadReset value)? loadReset,
  }) {
    return loadReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendingListEventLoadNextPage value)? loadNextPage,
    TResult Function(TrendingListEventLoadNextPageThisWweek value)?
        loadNextThisWeek,
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
