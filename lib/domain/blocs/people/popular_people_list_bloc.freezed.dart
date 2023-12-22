// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_people_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeopleListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() loadReset,
    required TResult Function(String query) searchMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? loadReset,
    TResult? Function(String query)? searchMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? loadReset,
    TResult Function(String query)? searchMovie,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeopleListEventLoadNextPage value) loadNextPage,
    required TResult Function(PeopleListEventLoadReset value) loadReset,
    required TResult Function(PeopleListEventSearchMovie value) searchMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeopleListEventLoadNextPage value)? loadNextPage,
    TResult? Function(PeopleListEventLoadReset value)? loadReset,
    TResult? Function(PeopleListEventSearchMovie value)? searchMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeopleListEventLoadNextPage value)? loadNextPage,
    TResult Function(PeopleListEventLoadReset value)? loadReset,
    TResult Function(PeopleListEventSearchMovie value)? searchMovie,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeopleListEventCopyWith<$Res> {
  factory $PeopleListEventCopyWith(
          PeopleListEvent value, $Res Function(PeopleListEvent) then) =
      _$PeopleListEventCopyWithImpl<$Res, PeopleListEvent>;
}

/// @nodoc
class _$PeopleListEventCopyWithImpl<$Res, $Val extends PeopleListEvent>
    implements $PeopleListEventCopyWith<$Res> {
  _$PeopleListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PeopleListEventLoadNextPageImplCopyWith<$Res> {
  factory _$$PeopleListEventLoadNextPageImplCopyWith(
          _$PeopleListEventLoadNextPageImpl value,
          $Res Function(_$PeopleListEventLoadNextPageImpl) then) =
      __$$PeopleListEventLoadNextPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$PeopleListEventLoadNextPageImplCopyWithImpl<$Res>
    extends _$PeopleListEventCopyWithImpl<$Res,
        _$PeopleListEventLoadNextPageImpl>
    implements _$$PeopleListEventLoadNextPageImplCopyWith<$Res> {
  __$$PeopleListEventLoadNextPageImplCopyWithImpl(
      _$PeopleListEventLoadNextPageImpl _value,
      $Res Function(_$PeopleListEventLoadNextPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$PeopleListEventLoadNextPageImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PeopleListEventLoadNextPageImpl implements PeopleListEventLoadNextPage {
  _$PeopleListEventLoadNextPageImpl({required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'PeopleListEvent.loadNextPage(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeopleListEventLoadNextPageImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeopleListEventLoadNextPageImplCopyWith<_$PeopleListEventLoadNextPageImpl>
      get copyWith => __$$PeopleListEventLoadNextPageImplCopyWithImpl<
          _$PeopleListEventLoadNextPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() loadReset,
    required TResult Function(String query) searchMovie,
  }) {
    return loadNextPage(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? loadReset,
    TResult? Function(String query)? searchMovie,
  }) {
    return loadNextPage?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? loadReset,
    TResult Function(String query)? searchMovie,
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
    required TResult Function(PeopleListEventLoadNextPage value) loadNextPage,
    required TResult Function(PeopleListEventLoadReset value) loadReset,
    required TResult Function(PeopleListEventSearchMovie value) searchMovie,
  }) {
    return loadNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeopleListEventLoadNextPage value)? loadNextPage,
    TResult? Function(PeopleListEventLoadReset value)? loadReset,
    TResult? Function(PeopleListEventSearchMovie value)? searchMovie,
  }) {
    return loadNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeopleListEventLoadNextPage value)? loadNextPage,
    TResult Function(PeopleListEventLoadReset value)? loadReset,
    TResult Function(PeopleListEventSearchMovie value)? searchMovie,
    required TResult orElse(),
  }) {
    if (loadNextPage != null) {
      return loadNextPage(this);
    }
    return orElse();
  }
}

abstract class PeopleListEventLoadNextPage implements PeopleListEvent {
  factory PeopleListEventLoadNextPage({required final String locale}) =
      _$PeopleListEventLoadNextPageImpl;

  String get locale;
  @JsonKey(ignore: true)
  _$$PeopleListEventLoadNextPageImplCopyWith<_$PeopleListEventLoadNextPageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PeopleListEventLoadResetImplCopyWith<$Res> {
  factory _$$PeopleListEventLoadResetImplCopyWith(
          _$PeopleListEventLoadResetImpl value,
          $Res Function(_$PeopleListEventLoadResetImpl) then) =
      __$$PeopleListEventLoadResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PeopleListEventLoadResetImplCopyWithImpl<$Res>
    extends _$PeopleListEventCopyWithImpl<$Res, _$PeopleListEventLoadResetImpl>
    implements _$$PeopleListEventLoadResetImplCopyWith<$Res> {
  __$$PeopleListEventLoadResetImplCopyWithImpl(
      _$PeopleListEventLoadResetImpl _value,
      $Res Function(_$PeopleListEventLoadResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PeopleListEventLoadResetImpl implements PeopleListEventLoadReset {
  _$PeopleListEventLoadResetImpl();

  @override
  String toString() {
    return 'PeopleListEvent.loadReset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeopleListEventLoadResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() loadReset,
    required TResult Function(String query) searchMovie,
  }) {
    return loadReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? loadReset,
    TResult? Function(String query)? searchMovie,
  }) {
    return loadReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? loadReset,
    TResult Function(String query)? searchMovie,
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
    required TResult Function(PeopleListEventLoadNextPage value) loadNextPage,
    required TResult Function(PeopleListEventLoadReset value) loadReset,
    required TResult Function(PeopleListEventSearchMovie value) searchMovie,
  }) {
    return loadReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeopleListEventLoadNextPage value)? loadNextPage,
    TResult? Function(PeopleListEventLoadReset value)? loadReset,
    TResult? Function(PeopleListEventSearchMovie value)? searchMovie,
  }) {
    return loadReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeopleListEventLoadNextPage value)? loadNextPage,
    TResult Function(PeopleListEventLoadReset value)? loadReset,
    TResult Function(PeopleListEventSearchMovie value)? searchMovie,
    required TResult orElse(),
  }) {
    if (loadReset != null) {
      return loadReset(this);
    }
    return orElse();
  }
}

abstract class PeopleListEventLoadReset implements PeopleListEvent {
  factory PeopleListEventLoadReset() = _$PeopleListEventLoadResetImpl;
}

/// @nodoc
abstract class _$$PeopleListEventSearchMovieImplCopyWith<$Res> {
  factory _$$PeopleListEventSearchMovieImplCopyWith(
          _$PeopleListEventSearchMovieImpl value,
          $Res Function(_$PeopleListEventSearchMovieImpl) then) =
      __$$PeopleListEventSearchMovieImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$PeopleListEventSearchMovieImplCopyWithImpl<$Res>
    extends _$PeopleListEventCopyWithImpl<$Res,
        _$PeopleListEventSearchMovieImpl>
    implements _$$PeopleListEventSearchMovieImplCopyWith<$Res> {
  __$$PeopleListEventSearchMovieImplCopyWithImpl(
      _$PeopleListEventSearchMovieImpl _value,
      $Res Function(_$PeopleListEventSearchMovieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$PeopleListEventSearchMovieImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PeopleListEventSearchMovieImpl implements PeopleListEventSearchMovie {
  _$PeopleListEventSearchMovieImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'PeopleListEvent.searchMovie(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeopleListEventSearchMovieImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeopleListEventSearchMovieImplCopyWith<_$PeopleListEventSearchMovieImpl>
      get copyWith => __$$PeopleListEventSearchMovieImplCopyWithImpl<
          _$PeopleListEventSearchMovieImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() loadReset,
    required TResult Function(String query) searchMovie,
  }) {
    return searchMovie(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? loadReset,
    TResult? Function(String query)? searchMovie,
  }) {
    return searchMovie?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? loadReset,
    TResult Function(String query)? searchMovie,
    required TResult orElse(),
  }) {
    if (searchMovie != null) {
      return searchMovie(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeopleListEventLoadNextPage value) loadNextPage,
    required TResult Function(PeopleListEventLoadReset value) loadReset,
    required TResult Function(PeopleListEventSearchMovie value) searchMovie,
  }) {
    return searchMovie(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeopleListEventLoadNextPage value)? loadNextPage,
    TResult? Function(PeopleListEventLoadReset value)? loadReset,
    TResult? Function(PeopleListEventSearchMovie value)? searchMovie,
  }) {
    return searchMovie?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeopleListEventLoadNextPage value)? loadNextPage,
    TResult Function(PeopleListEventLoadReset value)? loadReset,
    TResult Function(PeopleListEventSearchMovie value)? searchMovie,
    required TResult orElse(),
  }) {
    if (searchMovie != null) {
      return searchMovie(this);
    }
    return orElse();
  }
}

abstract class PeopleListEventSearchMovie implements PeopleListEvent {
  factory PeopleListEventSearchMovie({required final String query}) =
      _$PeopleListEventSearchMovieImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$PeopleListEventSearchMovieImplCopyWith<_$PeopleListEventSearchMovieImpl>
      get copyWith => throw _privateConstructorUsedError;
}
