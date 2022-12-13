class TvListData {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;
  final String overview;
  final String? firstAirDate;

  const TvListData({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
    required this.overview,
    this.firstAirDate,
  });
}