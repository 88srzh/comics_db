class TrendingListData {
  final int id;
  final String posterPath;
  final String releaseData;
  final String? title;
  final String? name;
  final String? firstAirDate;
  final String? mediaType;
  final bool? adult;
  final String overview;

  TrendingListData({
    required this.id,
    required this.posterPath,
    required this.releaseData,
    required this.title,
    required this.name,
    required this.firstAirDate,
    required this.mediaType,
    required this.adult,
    required this.overview,
  });
}
