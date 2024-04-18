import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_details_keywords.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsKeywords {
  final List<TvDetailsKeywordsResult>? results;

  const TvDetailsKeywords({required this.results});

  factory TvDetailsKeywords.fromJson(Map<String, dynamic> json) => _$TvDetailsKeywordsFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsKeywordsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvDetailsKeywordsResult {
  final String name;
  final int id;

  const TvDetailsKeywordsResult({
    required this.name,
    required this.id,
  });

  factory TvDetailsKeywordsResult.fromJson(Map<String, dynamic> json) => _$TvDetailsKeywordsResultFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsKeywordsResultToJson(this);
}
