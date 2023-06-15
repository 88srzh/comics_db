class MovieDetailsRecommendationsData {
  final int id;
  final String title;
  final String? posterPath;

  const MovieDetailsRecommendationsData({
    required this.id,
    required this.title,
    this.posterPath,
  });
}