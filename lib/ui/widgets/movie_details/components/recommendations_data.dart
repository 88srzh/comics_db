class MovieDetailsRecommendationsData {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;

  const MovieDetailsRecommendationsData({
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
  });
}