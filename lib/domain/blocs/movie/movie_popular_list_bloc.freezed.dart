// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_popular_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieListEvent {
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
    required TResult Function(MovieListEventLoadNextPage value) loadNextPage,
    required TResult Function(MovieListEventLoadReset value) reset,
    required TResult Function(MovieListEventSearchMovie value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult? Function(MovieListEventLoadReset value)? reset,
    TResult? Function(MovieListEventSearchMovie value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult Function(MovieListEventLoadReset value)? reset,
    TResult Function(MovieListEventSearchMovie value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListEventCopyWith<$Res> {
  factory $MovieListEventCopyWith(
          MovieListEvent value, $Res Function(MovieListEvent) then) =
      _$MovieListEventCopyWithImpl<$Res, MovieListEvent>;
}

/// @nodoc
class _$MovieListEventCopyWithImpl<$Res, $Val extends MovieListEvent>
    implements $MovieListEventCopyWith<$Res> {
  _$MovieListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MovieListEventLoadNextPageImplCopyWith<$Res> {
  factory _$$MovieListEventLoadNextPageImplCopyWith(
          _$MovieListEventLoadNextPageImpl value,
          $Res Function(_$MovieListEventLoadNextPageImpl) then) =
      __$$MovieListEventLoadNextPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$MovieListEventLoadNextPageImplCopyWithImpl<$Res>
    extends _$MovieListEventCopyWithImpl<$Res, _$MovieListEventLoadNextPageImpl>
    implements _$$MovieListEventLoadNextPageImplCopyWith<$Res> {
  __$$MovieListEventLoadNextPageImplCopyWithImpl(
      _$MovieListEventLoadNextPageImpl _value,
      $Res Function(_$MovieListEventLoadNextPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$MovieListEventLoadNextPageImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MovieListEventLoadNextPageImpl implements MovieListEventLoadNextPage {
  const _$MovieListEventLoadNextPageImpl({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'MovieListEvent.loadNextPage(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListEventLoadNextPageImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListEventLoadNextPageImplCopyWith<_$MovieListEventLoadNextPageImpl>
      get copyWith => __$$MovieListEventLoadNextPageImplCopyWithImpl<
          _$MovieListEventLoadNextPageImpl>(this, _$identity);

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
    required TResult Function(MovieListEventLoadNextPage value) loadNextPage,
    required TResult Function(MovieListEventLoadReset value) reset,
    required TResult Function(MovieListEventSearchMovie value) search,
  }) {
    return loadNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult? Function(MovieListEventLoadReset value)? reset,
    TResult? Function(MovieListEventSearchMovie value)? search,
  }) {
    return loadNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult Function(MovieListEventLoadReset value)? reset,
    TResult Function(MovieListEventSearchMovie value)? search,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage(this);
    }
    return orElse();
  }
}

abstract class MovieListEventLoadNextPage implements MovieListEvent {
  const factory MovieListEventLoadNextPage({required final String locale}) =
      _$MovieListEventLoadNextPageImpl;

  String get locale;
  @JsonKey(ignore: true)
  _$$MovieListEventLoadNextPageImplCopyWith<_$MovieListEventLoadNextPageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MovieListEventLoadResetImplCopyWith<$Res> {
  factory _$$MovieListEventLoadResetImplCopyWith(
          _$MovieListEventLoadResetImpl value,
          $Res Function(_$MovieListEventLoadResetImpl) then) =
      __$$MovieListEventLoadResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MovieListEventLoadResetImplCopyWithImpl<$Res>
    extends _$MovieListEventCopyWithImpl<$Res, _$MovieListEventLoadResetImpl>
    implements _$$MovieListEventLoadResetImplCopyWith<$Res> {
  __$$MovieListEventLoadResetImplCopyWithImpl(
      _$MovieListEventLoadResetImpl _value,
      $Res Function(_$MovieListEventLoadResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MovieListEventLoadResetImpl implements MovieListEventLoadReset {
  const _$MovieListEventLoadResetImpl();

  @override
  String toString() {
    return 'MovieListEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListEventLoadResetImpl);
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
    required TResult Function(MovieListEventLoadNextPage value) loadNextPage,
    required TResult Function(MovieListEventLoadReset value) reset,
    required TResult Function(MovieListEventSearchMovie value) search,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult? Function(MovieListEventLoadReset value)? reset,
    TResult? Function(MovieListEventSearchMovie value)? search,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult Function(MovieListEventLoadReset value)? reset,
    TResult Function(MovieListEventSearchMovie value)? search,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class MovieListEventLoadReset implements MovieListEvent {
  const factory MovieListEventLoadReset() = _$MovieListEventLoadResetImpl;
}

/// @nodoc
abstract class _$$MovieListEventSearchMovieImplCopyWith<$Res> {
  factory _$$MovieListEventSearchMovieImplCopyWith(
          _$MovieListEventSearchMovieImpl value,
          $Res Function(_$MovieListEventSearchMovieImpl) then) =
      __$$MovieListEventSearchMovieImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$MovieListEventSearchMovieImplCopyWithImpl<$Res>
    extends _$MovieListEventCopyWithImpl<$Res, _$MovieListEventSearchMovieImpl>
    implements _$$MovieListEventSearchMovieImplCopyWith<$Res> {
  __$$MovieListEventSearchMovieImplCopyWithImpl(
      _$MovieListEventSearchMovieImpl _value,
      $Res Function(_$MovieListEventSearchMovieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$MovieListEventSearchMovieImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MovieListEventSearchMovieImpl implements MovieListEventSearchMovie {
  const _$MovieListEventSearchMovieImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'MovieListEvent.search(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListEventSearchMovieImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListEventSearchMovieImplCopyWith<_$MovieListEventSearchMovieImpl>
      get copyWith => __$$MovieListEventSearchMovieImplCopyWithImpl<
          _$MovieListEventSearchMovieImpl>(this, _$identity);

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
    required TResult Function(MovieListEventLoadNextPage value) loadNextPage,
    required TResult Function(MovieListEventLoadReset value) reset,
    required TResult Function(MovieListEventSearchMovie value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult? Function(MovieListEventLoadReset value)? reset,
    TResult? Function(MovieListEventSearchMovie value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult Function(MovieListEventLoadReset value)? reset,
    TResult Function(MovieListEventSearchMovie value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class MovieListEventSearchMovie implements MovieListEvent {
  const factory MovieListEventSearchMovie({required final String query}) =
      _$MovieListEventSearchMovieImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$MovieListEventSearchMovieImplCopyWith<_$MovieListEventSearchMovieImpl>
      get copyWith => throw _privateConstructorUsedError;
}
