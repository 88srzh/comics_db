// Package imports:
import 'package:comics_db_app/domain/entity/data_parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_all.freezed.dart';

part 'trending_all.g.dart';

enum MediaType {movie, tv, person}

extension MediaTypeAsString on MediaType {
  String asString() {
    switch (this) {
      case MediaType.movie:
        return 'movie';
      case MediaType.tv:
        return 'tv';
      case MediaType.person:
        return 'person';
    }
  }
}

@freezed
class TrendingAll with _$TrendingAll {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  factory TrendingAll({
    String? posterPath,
    required bool adult,
    required String overview,
    @JsonKey(fromJson: parseDateFromString) DateTime? releaseDate,
    required List<int> genreIds,
    required int id,
    required String originalTitle,
    required String originalLanguage,
    required String title,
    String? backdropPath,
    required double popularity,
    required int voteCount,
    required bool video,
    required double voteAverage,
    required String mediaType,
    required String name,
    String? profilePath,
    @JsonKey(fromJson: parseDateFromString) DateTime? firstAirDate,
  }) = _TrendingAll;

  factory TrendingAll.fromJson(Map<String, dynamic> json) => _$TrendingAllFromJson(json);

// Map<String, dynamic> toJson() => _$TrendingAllToJson(this);
}
