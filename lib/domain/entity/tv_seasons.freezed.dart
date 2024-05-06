// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_seasons.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvSeasons _$TvSeasonsFromJson(Map<String, dynamic> json) {
  return _TvSeasons.fromJson(json);
}

/// @nodoc
mixin _$TvSeasons {
  @JsonKey(fromJson: parseDateFromString)
  DateTime? get airDate => throw _privateConstructorUsedError;
  List<TvSeasonDetails> get episodes => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get posterPath => throw _privateConstructorUsedError;
  int get seasonNumber => throw _privateConstructorUsedError;
  double get voteAverage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TvSeasonsCopyWith<TvSeasons> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeasonsCopyWith<$Res> {
  factory $TvSeasonsCopyWith(TvSeasons value, $Res Function(TvSeasons) then) =
      _$TvSeasonsCopyWithImpl<$Res, TvSeasons>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: parseDateFromString) DateTime? airDate,
      List<TvSeasonDetails> episodes,
      String name,
      String overview,
      int id,
      String posterPath,
      int seasonNumber,
      double voteAverage});
}

/// @nodoc
class _$TvSeasonsCopyWithImpl<$Res, $Val extends TvSeasons>
    implements $TvSeasonsCopyWith<$Res> {
  _$TvSeasonsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodes = null,
    Object? name = null,
    Object? overview = null,
    Object? id = null,
    Object? posterPath = null,
    Object? seasonNumber = null,
    Object? voteAverage = null,
  }) {
    return _then(_value.copyWith(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      episodes: null == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<TvSeasonDetails>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvSeasonsImplCopyWith<$Res>
    implements $TvSeasonsCopyWith<$Res> {
  factory _$$TvSeasonsImplCopyWith(
          _$TvSeasonsImpl value, $Res Function(_$TvSeasonsImpl) then) =
      __$$TvSeasonsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: parseDateFromString) DateTime? airDate,
      List<TvSeasonDetails> episodes,
      String name,
      String overview,
      int id,
      String posterPath,
      int seasonNumber,
      double voteAverage});
}

/// @nodoc
class __$$TvSeasonsImplCopyWithImpl<$Res>
    extends _$TvSeasonsCopyWithImpl<$Res, _$TvSeasonsImpl>
    implements _$$TvSeasonsImplCopyWith<$Res> {
  __$$TvSeasonsImplCopyWithImpl(
      _$TvSeasonsImpl _value, $Res Function(_$TvSeasonsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodes = null,
    Object? name = null,
    Object? overview = null,
    Object? id = null,
    Object? posterPath = null,
    Object? seasonNumber = null,
    Object? voteAverage = null,
  }) {
    return _then(_$TvSeasonsImpl(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      episodes: null == episodes
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<TvSeasonDetails>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$TvSeasonsImpl implements _TvSeasons {
  _$TvSeasonsImpl(
      {@JsonKey(fromJson: parseDateFromString) required this.airDate,
      required final List<TvSeasonDetails> episodes,
      required this.name,
      required this.overview,
      required this.id,
      required this.posterPath,
      required this.seasonNumber,
      required this.voteAverage})
      : _episodes = episodes;

  factory _$TvSeasonsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvSeasonsImplFromJson(json);

  @override
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? airDate;
  final List<TvSeasonDetails> _episodes;
  @override
  List<TvSeasonDetails> get episodes {
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  @override
  final String name;
  @override
  final String overview;
  @override
  final int id;
  @override
  final String posterPath;
  @override
  final int seasonNumber;
  @override
  final double voteAverage;

  @override
  String toString() {
    return 'TvSeasons(airDate: $airDate, episodes: $episodes, name: $name, overview: $overview, id: $id, posterPath: $posterPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvSeasonsImpl &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      airDate,
      const DeepCollectionEquality().hash(_episodes),
      name,
      overview,
      id,
      posterPath,
      seasonNumber,
      voteAverage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvSeasonsImplCopyWith<_$TvSeasonsImpl> get copyWith =>
      __$$TvSeasonsImplCopyWithImpl<_$TvSeasonsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvSeasonsImplToJson(
      this,
    );
  }
}

abstract class _TvSeasons implements TvSeasons {
  factory _TvSeasons(
      {@JsonKey(fromJson: parseDateFromString) required final DateTime? airDate,
      required final List<TvSeasonDetails> episodes,
      required final String name,
      required final String overview,
      required final int id,
      required final String posterPath,
      required final int seasonNumber,
      required final double voteAverage}) = _$TvSeasonsImpl;

  factory _TvSeasons.fromJson(Map<String, dynamic> json) =
      _$TvSeasonsImpl.fromJson;

  @override
  @JsonKey(fromJson: parseDateFromString)
  DateTime? get airDate;
  @override
  List<TvSeasonDetails> get episodes;
  @override
  String get name;
  @override
  String get overview;
  @override
  int get id;
  @override
  String get posterPath;
  @override
  int get seasonNumber;
  @override
  double get voteAverage;
  @override
  @JsonKey(ignore: true)
  _$$TvSeasonsImplCopyWith<_$TvSeasonsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
