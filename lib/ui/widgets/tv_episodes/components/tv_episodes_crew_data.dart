class TvEpisodesCrewData {
  String job = '';
  String department = '';
  String creditId = '';
  bool adult = false;
  int gender = 1;
  int id = 0;
  String knownForDepartment = '';
  String name = '';
  String originalName = '';
  double popularity = 0.0;
  String? profilePath = '';

  TvEpisodesCrewData({
    required this.job,
    required this.department,
    required this.creditId,
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
