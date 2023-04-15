// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_movies_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteMoviesListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadFavoriteMoviesTotalResults,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadFavoriteMoviesTotalResults,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadFavoriteMoviesTotalResults,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            FavoriteMoviesListEventLoadFavoriteMoviesTotalResults value)
        loadFavoriteMoviesTotalResults,
    required TResult Function(FavoriteMoviesListEventLoadReset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            FavoriteMoviesListEventLoadFavoriteMoviesTotalResults value)?
        loadFavoriteMoviesTotalResults,
    TResult? Function(FavoriteMoviesListEventLoadReset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            FavoriteMoviesListEventLoadFavoriteMoviesTotalResults value)?
        loadFavoriteMoviesTotalResults,
    TResult Function(FavoriteMoviesListEventLoadReset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteMoviesListEventCopyWith<$Res> {
  factory $FavoriteMoviesListEventCopyWith(FavoriteMoviesListEvent value,
          $Res Function(FavoriteMoviesListEvent) then) =
      _$FavoriteMoviesListEventCopyWithImpl<$Res, FavoriteMoviesListEvent>;
}

/// @nodoc
class _$FavoriteMoviesListEventCopyWithImpl<$Res,
        $Val extends FavoriteMoviesListEvent>
    implements $FavoriteMoviesListEventCopyWith<$Res> {
  _$FavoriteMoviesListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoriteMoviesListEventLoadFavoriteMoviesTotalResultsCopyWith<
    $Res> {
  factory _$$FavoriteMoviesListEventLoadFavoriteMoviesTotalResultsCopyWith(
          _$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults value,
          $Res Function(_$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults)
              then) =
      __$$FavoriteMoviesListEventLoadFavoriteMoviesTotalResultsCopyWithImpl<
          $Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$FavoriteMoviesListEventLoadFavoriteMoviesTotalResultsCopyWithImpl<
        $Res>
    extends _$FavoriteMoviesListEventCopyWithImpl<$Res,
        _$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults>
    implements
        _$$FavoriteMoviesListEventLoadFavoriteMoviesTotalResultsCopyWith<$Res> {
  __$$FavoriteMoviesListEventLoadFavoriteMoviesTotalResultsCopyWithImpl(
      _$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults _value,
      $Res Function(_$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults
    implements FavoriteMoviesListEventLoadFavoriteMoviesTotalResults {
  const _$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults(
      {required this.locale});

  @override
  final String locale;

  @override
  String toString() {
    return 'FavoriteMoviesListEvent.loadFavoriteMoviesTotalResults(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteMoviesListEventLoadFavoriteMoviesTotalResultsCopyWith<
          _$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults>
      get copyWith =>
          __$$FavoriteMoviesListEventLoadFavoriteMoviesTotalResultsCopyWithImpl<
                  _$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadFavoriteMoviesTotalResults,
    required TResult Function() reset,
  }) {
    return loadFavoriteMoviesTotalResults(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadFavoriteMoviesTotalResults,
    TResult? Function()? reset,
  }) {
    return loadFavoriteMoviesTotalResults?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadFavoriteMoviesTotalResults,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (loadFavoriteMoviesTotalResults != null) {
      return loadFavoriteMoviesTotalResults(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            FavoriteMoviesListEventLoadFavoriteMoviesTotalResults value)
        loadFavoriteMoviesTotalResults,
    required TResult Function(FavoriteMoviesListEventLoadReset value) reset,
  }) {
    return loadFavoriteMoviesTotalResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            FavoriteMoviesListEventLoadFavoriteMoviesTotalResults value)?
        loadFavoriteMoviesTotalResults,
    TResult? Function(FavoriteMoviesListEventLoadReset value)? reset,
  }) {
    return loadFavoriteMoviesTotalResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            FavoriteMoviesListEventLoadFavoriteMoviesTotalResults value)?
        loadFavoriteMoviesTotalResults,
    TResult Function(FavoriteMoviesListEventLoadReset value)? reset,
    required TResult orElse(),
  }) {
    if (loadFavoriteMoviesTotalResults != null) {
      return loadFavoriteMoviesTotalResults(this);
    }
    return orElse();
  }
}

abstract class FavoriteMoviesListEventLoadFavoriteMoviesTotalResults
    implements FavoriteMoviesListEvent {
  const factory FavoriteMoviesListEventLoadFavoriteMoviesTotalResults(
          {required final String locale}) =
      _$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults;

  String get locale;
  @JsonKey(ignore: true)
  _$$FavoriteMoviesListEventLoadFavoriteMoviesTotalResultsCopyWith<
          _$FavoriteMoviesListEventLoadFavoriteMoviesTotalResults>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteMoviesListEventLoadResetCopyWith<$Res> {
  factory _$$FavoriteMoviesListEventLoadResetCopyWith(
          _$FavoriteMoviesListEventLoadReset value,
          $Res Function(_$FavoriteMoviesListEventLoadReset) then) =
      __$$FavoriteMoviesListEventLoadResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteMoviesListEventLoadResetCopyWithImpl<$Res>
    extends _$FavoriteMoviesListEventCopyWithImpl<$Res,
        _$FavoriteMoviesListEventLoadReset>
    implements _$$FavoriteMoviesListEventLoadResetCopyWith<$Res> {
  __$$FavoriteMoviesListEventLoadResetCopyWithImpl(
      _$FavoriteMoviesListEventLoadReset _value,
      $Res Function(_$FavoriteMoviesListEventLoadReset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteMoviesListEventLoadReset
    implements FavoriteMoviesListEventLoadReset {
  const _$FavoriteMoviesListEventLoadReset();

  @override
  String toString() {
    return 'FavoriteMoviesListEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteMoviesListEventLoadReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String locale) loadFavoriteMoviesTotalResults,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String locale)? loadFavoriteMoviesTotalResults,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String locale)? loadFavoriteMoviesTotalResults,
    TResult Function()? reset,
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
    required TResult Function(
            FavoriteMoviesListEventLoadFavoriteMoviesTotalResults value)
        loadFavoriteMoviesTotalResults,
    required TResult Function(FavoriteMoviesListEventLoadReset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            FavoriteMoviesListEventLoadFavoriteMoviesTotalResults value)?
        loadFavoriteMoviesTotalResults,
    TResult? Function(FavoriteMoviesListEventLoadReset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            FavoriteMoviesListEventLoadFavoriteMoviesTotalResults value)?
        loadFavoriteMoviesTotalResults,
    TResult Function(FavoriteMoviesListEventLoadReset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class FavoriteMoviesListEventLoadReset
    implements FavoriteMoviesListEvent {
  const factory FavoriteMoviesListEventLoadReset() =
      _$FavoriteMoviesListEventLoadReset;
}
