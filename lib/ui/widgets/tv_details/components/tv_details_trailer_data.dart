class TvDetailsTrailerData {
  String? trailerKey;

  TvDetailsTrailerData({this.trailerKey});
}

class TvDetailsScoresData {
  // TODO change voteAverage to number
  final double? voteAverage;
  final int voteCount;
  final double popularity;

  TvDetailsScoresData({
    this.voteAverage,
    required this.voteCount,
    required this.popularity,
  });
}
