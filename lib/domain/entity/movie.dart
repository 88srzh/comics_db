import 'package:comics_db_app/domain/entity/data_parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  factory Movie({
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
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
