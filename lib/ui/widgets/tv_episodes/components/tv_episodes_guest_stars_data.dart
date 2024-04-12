class TvEpisodesGuestStarsData {
  String character = '';
  String creditId = '';
  int order = 0;
  bool adult = false;
  int gender = 0;
  int id = 0;
  String knownForDepartment = '';
  String name = '';
  String originalName = '';
  double popularity = 0.0;
  String? profilePath = '';

  TvEpisodesGuestStarsData({
    required this.character,
    required this.creditId,
    required this.order,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });
}
