class WatchlistData {
  final int id;
  final String posterPath;
  final String releaseData;
  final String? title;
  final String? name;
  final String firstAirDate;
  // final String mediaType;
  final String overview;

  const WatchlistData({
    required this.id,
    required this.posterPath,
    required this.releaseData,
    this.title,
    this.name,
    required this.firstAirDate,
    // required this.mediaType,
    required this.overview,
  });
}