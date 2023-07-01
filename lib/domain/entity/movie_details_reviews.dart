// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_reviews.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsReviews {
  final List<MovieDetailsReviewsResult> result;

  const MovieDetailsReviews({
    required this.result,
  });

  factory MovieDetailsReviews.fromJson(Map<String, dynamic> json) => _$MovieDetailsReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsReviewsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsReviewsResult {
  final String author;
  final List<AuthorDetails> authorDetails;
  final String content;
  final DateTime createdAt;
  final String id;
  final DateTime updatedAt;
  final String url;

  const MovieDetailsReviewsResult({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory MovieDetailsReviewsResult.fromJson(Map<String, dynamic> json) => _$MovieDetailsReviewsResultFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsReviewsResultToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AuthorDetails {
  final String? name;
  final String username;
  final String? avatarPath;
  final int? rating;

  const AuthorDetails({
    this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => _$AuthorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);
}
