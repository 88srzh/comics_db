// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/data_parser.dart';

part 'tv.freezed.dart';

part 'tv.g.dart';

@freezed
class TV with _$TV {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  factory TV({
    String? posterPath,
    required double popularity,
    required int id,
    String? backdropPath,
    required double voteAverage,
    required String overview,
    @JsonKey(fromJson: parseDateFromString) required DateTime? firstAirDate,
    required List<String> originCountry,
    required List<int> genreIds,
    required String originalLanguage,
    required double voteCount,
    required String name,
    required String originalName,
  }) = _TV;

  factory TV.fromJson(Map<String, dynamic> json) => _$TVFromJson(json);
  }
