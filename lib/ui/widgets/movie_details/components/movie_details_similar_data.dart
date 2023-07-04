class MovieDetailsSimilarData {
  final String? posterPath;
  final int id;
  final String title;
  final List<int> genreIds;

  const MovieDetailsSimilarData({
    this.posterPath,
    required this.id,
    required this.title,
    required this.genreIds,
  });
}