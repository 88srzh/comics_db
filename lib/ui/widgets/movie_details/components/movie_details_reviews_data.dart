class MovieDetailsReviewsData {
  final String author;
  final List<AuthorDetailsData> authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;

  const MovieDetailsReviewsData({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });
}

class AuthorDetailsData {
  final String? name;
  final String username;
  final String? avatarPath;
  final int? rating;

  const AuthorDetailsData({
    this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });
}
