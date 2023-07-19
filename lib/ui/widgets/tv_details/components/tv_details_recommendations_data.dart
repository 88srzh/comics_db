class TvDetailsRecommendationsData {
  final int id;
  final String? posterPath;
  final String? backdropPath;
  final String name;

  const TvDetailsRecommendationsData({
    required this.id,
    this.posterPath,
    this.backdropPath,
    required this.name,
  });
}