import 'package:json_annotation/json_annotation.dart';
import 'package:comics_db_app/domain/entity/latest_all.dart';

part 'latest_all_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class LatestAllResponse {
  final int page;
  @JsonKey(name: 'results')
  List<LatestAll> latestAll;
  final int totalResults;
  final int totalPages;

  LatestAllResponse({
    required this.page,
    required this.latestAll,
    required this.totalResults,
    required this.totalPages
    });

  factory LatestAllResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestAllResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LatestAllResponseToJson(this);
}
