class MovieListData {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final String originalTitle;
  final String? overview;
  final String releaseDate;
  // final String isFavorite;

  MovieListData({
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    // required this.isFavorite,
  });
}
