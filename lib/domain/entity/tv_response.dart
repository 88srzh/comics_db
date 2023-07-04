// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/tv.dart';

part 'tv_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TVResponse {
  final int page;
  @JsonKey(name: 'results')
  List<TV> tvs;
  final int totalResults;
  final int totalPages;

  TVResponse({
    required this.page,
    required this.tvs,
    required this.totalResults,
    required this.totalPages,
  });

  factory TVResponse.fromJson(Map<String, dynamic> json) => _$TVResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TVResponseToJson(this);
}
