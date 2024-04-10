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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$TvListEventLoadNextPageImplCopyWith<$Res> {
  factory _$$TvListEventLoadNextPageImplCopyWith(
          _$TvListEventLoadNextPageImpl value,
          $Res Function(_$TvListEventLoadNextPageImpl) then) =
      __$$TvListEventLoadNextPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$TvListEventLoadNextPageImplCopyWithImpl<$Res>
    extends _$TvListEventCopyWithImpl<$Res, _$TvListEventLoadNextPageImpl>
    implements _$$TvListEventLoadNextPageImplCopyWith<$Res> {
  __$$TvListEventLoadNextPageImplCopyWithImpl(
      _$TvListEventLoadNextPageImpl _value,
      $Res Function(_$TvListEventLoadNextPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$TvListEventLoadNextPageImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TvListEventLoadNextPageImpl implements TvListEventLoadNextPage {
  const _$TvListEventLoadNextPageImpl({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'TvListEvent.loadNextPage(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvListEventLoadNextPageImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvListEventLoadNextPageImplCopyWith<_$TvListEventLoadNextPageImpl>
      get copyWith => __$$TvListEventLoadNextPageImplCopyWithImpl<
          _$TvListEventLoadNextPageImpl>(this, _$identity);

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
      _$TvListEventLoadNextPageImpl;

  String get locale;
  @JsonKey(ignore: true)
  _$$TvListEventLoadNextPageImplCopyWith<_$TvListEventLoadNextPageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TvListEventLoadResetImplCopyWith<$Res> {
  factory _$$TvListEventLoadResetImplCopyWith(_$TvListEventLoadResetImpl value,
          $Res Function(_$TvListEventLoadResetImpl) then) =
      __$$TvListEventLoadResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TvListEventLoadResetImplCopyWithImpl<$Res>
    extends _$TvListEventCopyWithImpl<$Res, _$TvListEventLoadResetImpl>
    implements _$$TvListEventLoadResetImplCopyWith<$Res> {
  __$$TvListEventLoadResetImplCopyWithImpl(_$TvListEventLoadResetImpl _value,
      $Res Function(_$TvListEventLoadResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TvListEventLoadResetImpl implements TvListEventLoadReset {
  const _$TvListEventLoadResetImpl();

  @override
  String toString() {
    return 'TvListEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvListEventLoadResetImpl);
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
  const factory TvListEventLoadReset() = _$TvListEventLoadResetImpl;
}

/// @nodoc
abstract class _$$TvListEventSearchTvImplCopyWith<$Res> {
  factory _$$TvListEventSearchTvImplCopyWith(_$TvListEventSearchTvImpl value,
          $Res Function(_$TvListEventSearchTvImpl) then) =
      __$$TvListEventSearchTvImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$TvListEventSearchTvImplCopyWithImpl<$Res>
    extends _$TvListEventCopyWithImpl<$Res, _$TvListEventSearchTvImpl>
    implements _$$TvListEventSearchTvImplCopyWith<$Res> {
  __$$TvListEventSearchTvImplCopyWithImpl(_$TvListEventSearchTvImpl _value,
      $Res Function(_$TvListEventSearchTvImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$TvListEventSearchTvImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TvListEventSearchTvImpl implements TvListEventSearchTv {
  const _$TvListEventSearchTvImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'TvListEvent.search(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvListEventSearchTvImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvListEventSearchTvImplCopyWith<_$TvListEventSearchTvImpl> get copyWith =>
      __$$TvListEventSearchTvImplCopyWithImpl<_$TvListEventSearchTvImpl>(
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
      _$TvListEventSearchTvImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$TvListEventSearchTvImplCopyWith<_$TvListEventSearchTvImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
