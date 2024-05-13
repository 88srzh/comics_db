// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_season_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvSeasonDetails _$TvSeasonDetailsFromJson(Map<String, dynamic> json) {
  return _TvSeasonDetails.fromJson(json);
}

/// @nodoc
mixin _$TvSeasonDetails {
  @JsonKey(fromJson: parseDateFromString)
  DateTime? get airDate => throw _privateConstructorUsedError;
  int get episodeNumber => throw _privateConstructorUsedError;
  String get episodeType => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  String get productionCode => throw _privateConstructorUsedError;
  int get runtime => throw _privateConstructorUsedError;
  int get seasonNumber => throw _privateConstructorUsedError;
  int get showId => throw _privateConstructorUsedError;
  String? get stillPath => throw _privateConstructorUsedError;
  double get voteAverage => throw _privateConstructorUsedError;
  int get voteCount => throw _privateConstructorUsedError;
  List<TvSeasonDetailsCrew> get crew => throw _privateConstructorUsedError;
  List<TvSeasonDetailsGuestStars> get guestStars =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TvSeasonDetailsCopyWith<TvSeasonDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeasonDetailsCopyWith<$Res> {
  factory $TvSeasonDetailsCopyWith(
          TvSeasonDetails value, $Res Function(TvSeasonDetails) then) =
      _$TvSeasonDetailsCopyWithImpl<$Res, TvSeasonDetails>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: parseDateFromString) DateTime? airDate,
      int episodeNumber,
      String episodeType,
      int id,
      String name,
      String overview,
      String productionCode,
      int runtime,
      int seasonNumber,
      int showId,
      String? stillPath,
      double voteAverage,
      int voteCount,
      List<TvSeasonDetailsCrew> crew,
      List<TvSeasonDetailsGuestStars> guestStars});
}

/// @nodoc
class _$TvSeasonDetailsCopyWithImpl<$Res, $Val extends TvSeasonDetails>
    implements $TvSeasonDetailsCopyWith<$Res> {
  _$TvSeasonDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodeNumber = null,
    Object? episodeType = null,
    Object? id = null,
    Object? name = null,
    Object? overview = null,
    Object? productionCode = null,
    Object? runtime = null,
    Object? seasonNumber = null,
    Object? showId = null,
    Object? stillPath = freezed,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? crew = null,
    Object? guestStars = null,
  }) {
    return _then(_value.copyWith(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      episodeNumber: null == episodeNumber
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      episodeType: null == episodeType
          ? _value.episodeType
          : episodeType // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      productionCode: null == productionCode
          ? _value.productionCode
          : productionCode // ignore: cast_nullable_to_non_nullable
              as String,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      showId: null == showId
          ? _value.showId
          : showId // ignore: cast_nullable_to_non_nullable
              as int,
      stillPath: freezed == stillPath
          ? _value.stillPath
          : stillPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      crew: null == crew
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<TvSeasonDetailsCrew>,
      guestStars: null == guestStars
          ? _value.guestStars
          : guestStars // ignore: cast_nullable_to_non_nullable
              as List<TvSeasonDetailsGuestStars>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvSeasonDetailsImplCopyWith<$Res>
    implements $TvSeasonDetailsCopyWith<$Res> {
  factory _$$TvSeasonDetailsImplCopyWith(_$TvSeasonDetailsImpl value,
          $Res Function(_$TvSeasonDetailsImpl) then) =
      __$$TvSeasonDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: parseDateFromString) DateTime? airDate,
      int episodeNumber,
      String episodeType,
      int id,
      String name,
      String overview,
      String productionCode,
      int runtime,
      int seasonNumber,
      int showId,
      String? stillPath,
      double voteAverage,
      int voteCount,
      List<TvSeasonDetailsCrew> crew,
      List<TvSeasonDetailsGuestStars> guestStars});
}

/// @nodoc
class __$$TvSeasonDetailsImplCopyWithImpl<$Res>
    extends _$TvSeasonDetailsCopyWithImpl<$Res, _$TvSeasonDetailsImpl>
    implements _$$TvSeasonDetailsImplCopyWith<$Res> {
  __$$TvSeasonDetailsImplCopyWithImpl(
      _$TvSeasonDetailsImpl _value, $Res Function(_$TvSeasonDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodeNumber = null,
    Object? episodeType = null,
    Object? id = null,
    Object? name = null,
    Object? overview = null,
    Object? productionCode = null,
    Object? runtime = null,
    Object? seasonNumber = null,
    Object? showId = null,
    Object? stillPath = freezed,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? crew = null,
    Object? guestStars = null,
  }) {
    return _then(_$TvSeasonDetailsImpl(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      episodeNumber: null == episodeNumber
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      episodeType: null == episodeType
          ? _value.episodeType
          : episodeType // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      productionCode: null == productionCode
          ? _value.productionCode
          : productionCode // ignore: cast_nullable_to_non_nullable
              as String,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      showId: null == showId
          ? _value.showId
          : showId // ignore: cast_nullable_to_non_nullable
              as int,
      stillPath: freezed == stillPath
          ? _value.stillPath
          : stillPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      crew: null == crew
          ? _value._crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<TvSeasonDetailsCrew>,
      guestStars: null == guestStars
          ? _value._guestStars
          : guestStars // ignore: cast_nullable_to_non_nullable
              as List<TvSeasonDetailsGuestStars>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$TvSeasonDetailsImpl implements _TvSeasonDetails {
  _$TvSeasonDetailsImpl(
      {@JsonKey(fromJson: parseDateFromString) required this.airDate,
      required this.episodeNumber,
      required this.episodeType,
      required this.id,
      required this.name,
      required this.overview,
      required this.productionCode,
      required this.runtime,
      required this.seasonNumber,
      required this.showId,
      this.stillPath,
      required this.voteAverage,
      required this.voteCount,
      required final List<TvSeasonDetailsCrew> crew,
      required final List<TvSeasonDetailsGuestStars> guestStars})
      : _crew = crew,
        _guestStars = guestStars;

  factory _$TvSeasonDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvSeasonDetailsImplFromJson(json);

  @override
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? airDate;
  @override
  final int episodeNumber;
  @override
  final String episodeType;
  @override
  final int id;
  @override
  final String name;
  @override
  final String overview;
  @override
  final String productionCode;
  @override
  final int runtime;
  @override
  final int seasonNumber;
  @override
  final int showId;
  @override
  final String? stillPath;
  @override
  final double voteAverage;
  @override
  final int voteCount;
  final List<TvSeasonDetailsCrew> _crew;
  @override
  List<TvSeasonDetailsCrew> get crew {
    if (_crew is EqualUnmodifiableListView) return _crew;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crew);
  }

  final List<TvSeasonDetailsGuestStars> _guestStars;
  @override
  List<TvSeasonDetailsGuestStars> get guestStars {
    if (_guestStars is EqualUnmodifiableListView) return _guestStars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guestStars);
  }

  @override
  String toString() {
    return 'TvSeasonDetails(airDate: $airDate, episodeNumber: $episodeNumber, episodeType: $episodeType, id: $id, name: $name, overview: $overview, productionCode: $productionCode, runtime: $runtime, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath, voteAverage: $voteAverage, voteCount: $voteCount, crew: $crew, guestStars: $guestStars)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvSeasonDetailsImpl &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber) &&
            (identical(other.episodeType, episodeType) ||
                other.episodeType == episodeType) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.productionCode, productionCode) ||
                other.productionCode == productionCode) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber) &&
            (identical(other.showId, showId) || other.showId == showId) &&
            (identical(other.stillPath, stillPath) ||
                other.stillPath == stillPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            const DeepCollectionEquality().equals(other._crew, _crew) &&
            const DeepCollectionEquality()
                .equals(other._guestStars, _guestStars));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      airDate,
      episodeNumber,
      episodeType,
      id,
      name,
      overview,
      productionCode,
      runtime,
      seasonNumber,
      showId,
      stillPath,
      voteAverage,
      voteCount,
      const DeepCollectionEquality().hash(_crew),
      const DeepCollectionEquality().hash(_guestStars));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvSeasonDetailsImplCopyWith<_$TvSeasonDetailsImpl> get copyWith =>
      __$$TvSeasonDetailsImplCopyWithImpl<_$TvSeasonDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvSeasonDetailsImplToJson(
      this,
    );
  }
}

abstract class _TvSeasonDetails implements TvSeasonDetails {
  factory _TvSeasonDetails(
      {@JsonKey(fromJson: parseDateFromString) required final DateTime? airDate,
      required final int episodeNumber,
      required final String episodeType,
      required final int id,
      required final String name,
      required final String overview,
      required final String productionCode,
      required final int runtime,
      required final int seasonNumber,
      required final int showId,
      final String? stillPath,
      required final double voteAverage,
      required final int voteCount,
      required final List<TvSeasonDetailsCrew> crew,
      required final List<TvSeasonDetailsGuestStars>
          guestStars}) = _$TvSeasonDetailsImpl;

  factory _TvSeasonDetails.fromJson(Map<String, dynamic> json) =
      _$TvSeasonDetailsImpl.fromJson;

  @override
  @JsonKey(fromJson: parseDateFromString)
  DateTime? get airDate;
  @override
  int get episodeNumber;
  @override
  String get episodeType;
  @override
  int get id;
  @override
  String get name;
  @override
  String get overview;
  @override
  String get productionCode;
  @override
  int get runtime;
  @override
  int get seasonNumber;
  @override
  int get showId;
  @override
  String? get stillPath;
  @override
  double get voteAverage;
  @override
  int get voteCount;
  @override
  List<TvSeasonDetailsCrew> get crew;
  @override
  List<TvSeasonDetailsGuestStars> get guestStars;
  @override
  @JsonKey(ignore: true)
  _$$TvSeasonDetailsImplCopyWith<_$TvSeasonDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
