import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_keywords.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsKeywords {
  final List<MovieDetailsKeywordsResult> keywords;

  const MovieDetailsKeywords({required this.keywords});

  factory MovieDetailsKeywords.fromJson(Map<String, dynamic> json) => _$MovieDetailsKeywordsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsKeywordsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsKeywordsResult {
  final int id;
  final String name;

  MovieDetailsKeywordsResult({
    required this.id,
    required this.name,
  });

  factory MovieDetailsKeywordsResult.fromJson(Map<String, dynamic> json) => _$MovieDetailsKeywordsResultFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsKeywordsResultToJson(this);
}
