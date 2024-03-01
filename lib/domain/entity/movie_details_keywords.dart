import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_keywords.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsKeywords {
  final int id;
  final String name;

  MovieDetailsKeywords({
    required this.id,
    required this.name,
  });

  factory MovieDetailsKeywords.fromJson(Map<String, dynamic> json) => _$MovieDetailsKeywordsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsKeywordsToJson(this);
}
