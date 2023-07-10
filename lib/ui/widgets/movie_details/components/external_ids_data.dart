class MovieDetailsExternalIdsData {
  final int id;
  final String? imdbId;
  final String? wikidataId;
  final String? facebookId;
  final String? instagramId;
  final String? twitterId;

  MovieDetailsExternalIdsData({
    required this.id,
    this.imdbId,
    this.wikidataId,
    this.facebookId,
    this.instagramId,
    this.twitterId,
  });
}
