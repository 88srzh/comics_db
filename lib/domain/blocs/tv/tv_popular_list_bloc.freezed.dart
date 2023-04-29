// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_popular_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TvListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() reset,
    required TResult Function(String query) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? reset,
    TResult? Function(String query)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? reset,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TvListEventLoadNextPage value) loadNextPage,
    required TResult Function(TvListEventLoadReset value) reset,
    required TResult Function(TvListEventSearchTv value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TvListEventLoadNextPage value)? loadNextPage,
    TResult? Function(TvListEventLoadReset value)? reset,
    TResult? Function(TvListEventSearchTv value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TvListEventLoadNextPage value)? loadNextPage,
    TResult Function(TvListEventLoadReset value)? reset,
    TResult Function(TvListEventSearchTv value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvListEventCopyWith<$Res> {
  factory $TvListEventCopyWith(
          TvListEvent value, $Res Function(TvListEvent) then) =
      _$TvListEventCopyWithImpl<$Res, TvListEvent>;
}

/// @nodoc
class _$TvListEventCopyWithImpl<$Res, $Val extends TvListEvent>
    implements $TvListEventCopyWith<$Res> {
  _$TvListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TvListEventLoadNextPageCopyWith<$Res> {
  factory _$$TvListEventLoadNextPageCopyWith(_$TvListEventLoadNextPage value,
          $Res Function(_$TvListEventLoadNextPage) then) =
      __$$TvListEventLoadNextPageCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TvListEventLoadNextPageCopyWithImpl<$Res>
    extends _$TvListEventCopyWithImpl<$Res, _$TvListEventLoadNextPage>
    implements _$$TvListEventLoadNextPageCopyWith<$Res> {
  __$$TvListEventLoadNextPageCopyWithImpl(_$TvListEventLoadNextPage _value,
      $Res Function(_$TvListEventLoadNextPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TvListEventLoadNextPage(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TvListEventLoadNextPage implements TvListEventLoadNextPage {
  const _$TvListEventLoadNextPage({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TvListEvent.loadNextPage(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvListEventLoadNextPage &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvListEventLoadNextPageCopyWith<_$TvListEventLoadNextPage> get copyWith =>
      __$$TvListEventLoadNextPageCopyWithImpl<_$TvListEventLoadNextPage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() reset,
    required TResult Function(String query) search,
  }) {
    return loadNextPage(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? reset,
    TResult? Function(String query)? search,
  }) {
    return loadNextPage?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? reset,
    TResult Function(String query)? search,
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
    required TResult Function(TvListEventLoadNextPage value) loadNextPage,
    required TResult Function(TvListEventLoadReset value) reset,
    required TResult Function(TvListEventSearchTv value) search,
  }) {
    return loadNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TvListEventLoadNextPage value)? loadNextPage,
    TResult? Function(TvListEventLoadReset value)? reset,
    TResult? Function(TvListEventSearchTv value)? search,
  }) {
    return loadNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TvListEventLoadNextPage value)? loadNextPage,
    TResult Function(TvListEventLoadReset value)? reset,
    TResult Function(TvListEventSearchTv value)? search,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage(this);
    }
    return orElse();
  }
}

abstract class TvListEventLoadNextPage implements TvListEvent {
  const factory TvListEventLoadNextPage({required final String locale}) =
      _$TvListEventLoadNextPage;

  String get locale;
  @JsonKey(ignore: true)
  _$$TvListEventLoadNextPageCopyWith<_$TvListEventLoadNextPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TvListEventLoadResetCopyWith<$Res> {
  factory _$$TvListEventLoadResetCopyWith(_$TvListEventLoadReset value,
          $Res Function(_$TvListEventLoadReset) then) =
      __$$TvListEventLoadResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TvListEventLoadResetCopyWithImpl<$Res>
    extends _$TvListEventCopyWithImpl<$Res, _$TvListEventLoadReset>
    implements _$$TvListEventLoadResetCopyWith<$Res> {
  __$$TvListEventLoadResetCopyWithImpl(_$TvListEventLoadReset _value,
      $Res Function(_$TvListEventLoadReset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TvListEventLoadReset implements TvListEventLoadReset {
  const _$TvListEventLoadReset();

  @override
  String toString() {
    return 'TvListEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TvListEventLoadReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() reset,
    required TResult Function(String query) search,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? reset,
    TResult? Function(String query)? search,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? reset,
    TResult Function(String query)? search,
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
    required TResult Function(TvListEventLoadNextPage value) loadNextPage,
    required TResult Function(TvListEventLoadReset value) reset,
    required TResult Function(TvListEventSearchTv value) search,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TvListEventLoadNextPage value)? loadNextPage,
    TResult? Function(TvListEventLoadReset value)? reset,
    TResult? Function(TvListEventSearchTv value)? search,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TvListEventLoadNextPage value)? loadNextPage,
    TResult Function(TvListEventLoadReset value)? reset,
    TResult Function(TvListEventSearchTv value)? search,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class TvListEventLoadReset implements TvListEvent {
  const factory TvListEventLoadReset() = _$TvListEventLoadReset;
}

/// @nodoc
abstract class _$$TvListEventSearchTvCopyWith<$Res> {
  factory _$$TvListEventSearchTvCopyWith(_$TvListEventSearchTv value,
          $Res Function(_$TvListEventSearchTv) then) =
      __$$TvListEventSearchTvCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$TvListEventSearchTvCopyWithImpl<$Res>
    extends _$TvListEventCopyWithImpl<$Res, _$TvListEventSearchTv>
    implements _$$TvListEventSearchTvCopyWith<$Res> {
  __$$TvListEventSearchTvCopyWithImpl(
      _$TvListEventSearchTv _value, $Res Function(_$TvListEventSearchTv) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$TvListEventSearchTv(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TvListEventSearchTv implements TvListEventSearchTv {
  const _$TvListEventSearchTv({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'TvListEvent.search(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvListEventSearchTv &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvListEventSearchTvCopyWith<_$TvListEventSearchTv> get copyWith =>
      __$$TvListEventSearchTvCopyWithImpl<_$TvListEventSearchTv>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() reset,
    required TResult Function(String query) search,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? reset,
    TResult? Function(String query)? search,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? reset,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TvListEventLoadNextPage value) loadNextPage,
    required TResult Function(TvListEventLoadReset value) reset,
    required TResult Function(TvListEventSearchTv value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TvListEventLoadNextPage value)? loadNextPage,
    TResult? Function(TvListEventLoadReset value)? reset,
    TResult? Function(TvListEventSearchTv value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TvListEventLoadNextPage value)? loadNextPage,
    TResult Function(TvListEventLoadReset value)? reset,
    TResult Function(TvListEventSearchTv value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class TvListEventSearchTv implements TvListEvent {
  const factory TvListEventSearchTv({required final String query}) =
      _$TvListEventSearchTv;

  String get query;
  @JsonKey(ignore: true)
  _$$TvListEventSearchTvCopyWith<_$TvListEventSearchTv> get copyWith =>
      throw _privateConstructorUsedError;
}
