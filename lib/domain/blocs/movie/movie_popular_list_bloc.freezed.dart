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
    required TResult Function() addFavorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? reset,
    TResult? Function(String query)? search,
    TResult? Function()? addFavorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? reset,
    TResult Function(String query)? search,
    TResult Function()? addFavorite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieListEventLoadNextPage value) loadNextPage,
    required TResult Function(MovieListEventLoadReset value) reset,
    required TResult Function(MovieListEventSearchMovie value) search,
    required TResult Function(MovieListEventFaforiteItemEvent value)
        addFavorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult? Function(MovieListEventLoadReset value)? reset,
    TResult? Function(MovieListEventSearchMovie value)? search,
    TResult? Function(MovieListEventFaforiteItemEvent value)? addFavorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult Function(MovieListEventLoadReset value)? reset,
    TResult Function(MovieListEventSearchMovie value)? search,
    TResult Function(MovieListEventFaforiteItemEvent value)? addFavorite,
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
abstract class _$$MovieListEventLoadNextPageCopyWith<$Res> {
  factory _$$MovieListEventLoadNextPageCopyWith(
          _$MovieListEventLoadNextPage value,
          $Res Function(_$MovieListEventLoadNextPage) then) =
      __$$MovieListEventLoadNextPageCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$MovieListEventLoadNextPageCopyWithImpl<$Res>
    extends _$MovieListEventCopyWithImpl<$Res, _$MovieListEventLoadNextPage>
    implements _$$MovieListEventLoadNextPageCopyWith<$Res> {
  __$$MovieListEventLoadNextPageCopyWithImpl(
      _$MovieListEventLoadNextPage _value,
      $Res Function(_$MovieListEventLoadNextPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$MovieListEventLoadNextPage(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MovieListEventLoadNextPage implements MovieListEventLoadNextPage {
  const _$MovieListEventLoadNextPage({required this.locale});

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
            other is _$MovieListEventLoadNextPage &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListEventLoadNextPageCopyWith<_$MovieListEventLoadNextPage>
      get copyWith => __$$MovieListEventLoadNextPageCopyWithImpl<
          _$MovieListEventLoadNextPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() reset,
    required TResult Function(String query) search,
    required TResult Function() addFavorite,
  }) {
    return loadNextPage(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? reset,
    TResult? Function(String query)? search,
    TResult? Function()? addFavorite,
  }) {
    return loadNextPage?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? reset,
    TResult Function(String query)? search,
    TResult Function()? addFavorite,
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
    required TResult Function(MovieListEventFaforiteItemEvent value)
        addFavorite,
  }) {
    return loadNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult? Function(MovieListEventLoadReset value)? reset,
    TResult? Function(MovieListEventSearchMovie value)? search,
    TResult? Function(MovieListEventFaforiteItemEvent value)? addFavorite,
  }) {
    return loadNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult Function(MovieListEventLoadReset value)? reset,
    TResult Function(MovieListEventSearchMovie value)? search,
    TResult Function(MovieListEventFaforiteItemEvent value)? addFavorite,
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
      _$MovieListEventLoadNextPage;

  String get locale;
  @JsonKey(ignore: true)
  _$$MovieListEventLoadNextPageCopyWith<_$MovieListEventLoadNextPage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MovieListEventLoadResetCopyWith<$Res> {
  factory _$$MovieListEventLoadResetCopyWith(_$MovieListEventLoadReset value,
          $Res Function(_$MovieListEventLoadReset) then) =
      __$$MovieListEventLoadResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MovieListEventLoadResetCopyWithImpl<$Res>
    extends _$MovieListEventCopyWithImpl<$Res, _$MovieListEventLoadReset>
    implements _$$MovieListEventLoadResetCopyWith<$Res> {
  __$$MovieListEventLoadResetCopyWithImpl(_$MovieListEventLoadReset _value,
      $Res Function(_$MovieListEventLoadReset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MovieListEventLoadReset implements MovieListEventLoadReset {
  const _$MovieListEventLoadReset();

  @override
  String toString() {
    return 'MovieListEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListEventLoadReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() reset,
    required TResult Function(String query) search,
    required TResult Function() addFavorite,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? reset,
    TResult? Function(String query)? search,
    TResult? Function()? addFavorite,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? reset,
    TResult Function(String query)? search,
    TResult Function()? addFavorite,
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
    required TResult Function(MovieListEventFaforiteItemEvent value)
        addFavorite,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult? Function(MovieListEventLoadReset value)? reset,
    TResult? Function(MovieListEventSearchMovie value)? search,
    TResult? Function(MovieListEventFaforiteItemEvent value)? addFavorite,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult Function(MovieListEventLoadReset value)? reset,
    TResult Function(MovieListEventSearchMovie value)? search,
    TResult Function(MovieListEventFaforiteItemEvent value)? addFavorite,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class MovieListEventLoadReset implements MovieListEvent {
  const factory MovieListEventLoadReset() = _$MovieListEventLoadReset;
}

/// @nodoc
abstract class _$$MovieListEventSearchMovieCopyWith<$Res> {
  factory _$$MovieListEventSearchMovieCopyWith(
          _$MovieListEventSearchMovie value,
          $Res Function(_$MovieListEventSearchMovie) then) =
      __$$MovieListEventSearchMovieCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$MovieListEventSearchMovieCopyWithImpl<$Res>
    extends _$MovieListEventCopyWithImpl<$Res, _$MovieListEventSearchMovie>
    implements _$$MovieListEventSearchMovieCopyWith<$Res> {
  __$$MovieListEventSearchMovieCopyWithImpl(_$MovieListEventSearchMovie _value,
      $Res Function(_$MovieListEventSearchMovie) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$MovieListEventSearchMovie(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MovieListEventSearchMovie implements MovieListEventSearchMovie {
  const _$MovieListEventSearchMovie({required this.query});

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
            other is _$MovieListEventSearchMovie &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListEventSearchMovieCopyWith<_$MovieListEventSearchMovie>
      get copyWith => __$$MovieListEventSearchMovieCopyWithImpl<
          _$MovieListEventSearchMovie>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() reset,
    required TResult Function(String query) search,
    required TResult Function() addFavorite,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? reset,
    TResult? Function(String query)? search,
    TResult? Function()? addFavorite,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? reset,
    TResult Function(String query)? search,
    TResult Function()? addFavorite,
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
    required TResult Function(MovieListEventFaforiteItemEvent value)
        addFavorite,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult? Function(MovieListEventLoadReset value)? reset,
    TResult? Function(MovieListEventSearchMovie value)? search,
    TResult? Function(MovieListEventFaforiteItemEvent value)? addFavorite,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult Function(MovieListEventLoadReset value)? reset,
    TResult Function(MovieListEventSearchMovie value)? search,
    TResult Function(MovieListEventFaforiteItemEvent value)? addFavorite,
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
      _$MovieListEventSearchMovie;

  String get query;
  @JsonKey(ignore: true)
  _$$MovieListEventSearchMovieCopyWith<_$MovieListEventSearchMovie>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MovieListEventFaforiteItemEventCopyWith<$Res> {
  factory _$$MovieListEventFaforiteItemEventCopyWith(
          _$MovieListEventFaforiteItemEvent value,
          $Res Function(_$MovieListEventFaforiteItemEvent) then) =
      __$$MovieListEventFaforiteItemEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MovieListEventFaforiteItemEventCopyWithImpl<$Res>
    extends _$MovieListEventCopyWithImpl<$Res,
        _$MovieListEventFaforiteItemEvent>
    implements _$$MovieListEventFaforiteItemEventCopyWith<$Res> {
  __$$MovieListEventFaforiteItemEventCopyWithImpl(
      _$MovieListEventFaforiteItemEvent _value,
      $Res Function(_$MovieListEventFaforiteItemEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MovieListEventFaforiteItemEvent
    implements MovieListEventFaforiteItemEvent {
  const _$MovieListEventFaforiteItemEvent();

  @override
  String toString() {
    return 'MovieListEvent.addFavorite()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListEventFaforiteItemEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadNextPage,
    required TResult Function() reset,
    required TResult Function(String query) search,
    required TResult Function() addFavorite,
  }) {
    return addFavorite();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadNextPage,
    TResult? Function()? reset,
    TResult? Function(String query)? search,
    TResult? Function()? addFavorite,
  }) {
    return addFavorite?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadNextPage,
    TResult Function()? reset,
    TResult Function(String query)? search,
    TResult Function()? addFavorite,
    required TResult orElse(),
  }) {
    if (addFavorite != null) {
      return addFavorite();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieListEventLoadNextPage value) loadNextPage,
    required TResult Function(MovieListEventLoadReset value) reset,
    required TResult Function(MovieListEventSearchMovie value) search,
    required TResult Function(MovieListEventFaforiteItemEvent value)
        addFavorite,
  }) {
    return addFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult? Function(MovieListEventLoadReset value)? reset,
    TResult? Function(MovieListEventSearchMovie value)? search,
    TResult? Function(MovieListEventFaforiteItemEvent value)? addFavorite,
  }) {
    return addFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieListEventLoadNextPage value)? loadNextPage,
    TResult Function(MovieListEventLoadReset value)? reset,
    TResult Function(MovieListEventSearchMovie value)? search,
    TResult Function(MovieListEventFaforiteItemEvent value)? addFavorite,
    required TResult orElse(),
  }) {
    if (addFavorite != null) {
      return addFavorite(this);
    }
    return orElse();
  }
}

abstract class MovieListEventFaforiteItemEvent implements MovieListEvent {
  const factory MovieListEventFaforiteItemEvent() =
      _$MovieListEventFaforiteItemEvent;
}
