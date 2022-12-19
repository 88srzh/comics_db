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
abstract class _$$PeopleListEventLoadNextPageCopyWith<$Res> {
  factory _$$PeopleListEventLoadNextPageCopyWith(
          _$PeopleListEventLoadNextPage value,
          $Res Function(_$PeopleListEventLoadNextPage) then) =
      __$$PeopleListEventLoadNextPageCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$PeopleListEventLoadNextPageCopyWithImpl<$Res>
    extends _$PeopleListEventCopyWithImpl<$Res, _$PeopleListEventLoadNextPage>
    implements _$$PeopleListEventLoadNextPageCopyWith<$Res> {
  __$$PeopleListEventLoadNextPageCopyWithImpl(
      _$PeopleListEventLoadNextPage _value,
      $Res Function(_$PeopleListEventLoadNextPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$PeopleListEventLoadNextPage(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PeopleListEventLoadNextPage implements PeopleListEventLoadNextPage {
  _$PeopleListEventLoadNextPage({required this.locale});

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
            other is _$PeopleListEventLoadNextPage &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeopleListEventLoadNextPageCopyWith<_$PeopleListEventLoadNextPage>
      get copyWith => __$$PeopleListEventLoadNextPageCopyWithImpl<
          _$PeopleListEventLoadNextPage>(this, _$identity);

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
      _$PeopleListEventLoadNextPage;

  String get locale;
  @JsonKey(ignore: true)
  _$$PeopleListEventLoadNextPageCopyWith<_$PeopleListEventLoadNextPage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PeopleListEventLoadResetCopyWith<$Res> {
  factory _$$PeopleListEventLoadResetCopyWith(_$PeopleListEventLoadReset value,
          $Res Function(_$PeopleListEventLoadReset) then) =
      __$$PeopleListEventLoadResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PeopleListEventLoadResetCopyWithImpl<$Res>
    extends _$PeopleListEventCopyWithImpl<$Res, _$PeopleListEventLoadReset>
    implements _$$PeopleListEventLoadResetCopyWith<$Res> {
  __$$PeopleListEventLoadResetCopyWithImpl(_$PeopleListEventLoadReset _value,
      $Res Function(_$PeopleListEventLoadReset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PeopleListEventLoadReset implements PeopleListEventLoadReset {
  _$PeopleListEventLoadReset();

  @override
  String toString() {
    return 'PeopleListEvent.loadReset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeopleListEventLoadReset);
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
  factory PeopleListEventLoadReset() = _$PeopleListEventLoadReset;
}

/// @nodoc
abstract class _$$PeopleListEventSearchMovieCopyWith<$Res> {
  factory _$$PeopleListEventSearchMovieCopyWith(
          _$PeopleListEventSearchMovie value,
          $Res Function(_$PeopleListEventSearchMovie) then) =
      __$$PeopleListEventSearchMovieCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$PeopleListEventSearchMovieCopyWithImpl<$Res>
    extends _$PeopleListEventCopyWithImpl<$Res, _$PeopleListEventSearchMovie>
    implements _$$PeopleListEventSearchMovieCopyWith<$Res> {
  __$$PeopleListEventSearchMovieCopyWithImpl(
      _$PeopleListEventSearchMovie _value,
      $Res Function(_$PeopleListEventSearchMovie) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$PeopleListEventSearchMovie(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PeopleListEventSearchMovie implements PeopleListEventSearchMovie {
  _$PeopleListEventSearchMovie({required this.query});

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
            other is _$PeopleListEventSearchMovie &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeopleListEventSearchMovieCopyWith<_$PeopleListEventSearchMovie>
      get copyWith => __$$PeopleListEventSearchMovieCopyWithImpl<
          _$PeopleListEventSearchMovie>(this, _$identity);

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
      _$PeopleListEventSearchMovie;

  String get query;
  @JsonKey(ignore: true)
  _$$PeopleListEventSearchMovieCopyWith<_$PeopleListEventSearchMovie>
      get copyWith => throw _privateConstructorUsedError;
}
