class TvDetailsSeasonData {
  final String? airDate;
  final String? fullAirDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final int seasonNumber;
  final double? voteAverage;

  const TvDetailsSeasonData({
    required this.airDate,
    required this.fullAirDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });
}