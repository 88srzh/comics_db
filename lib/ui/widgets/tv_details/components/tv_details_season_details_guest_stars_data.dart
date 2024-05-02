class TvDetailsSeasonDetailsGuestStarsData {
  final String character;
  final String creditId;
  final int order;
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final String? profilePath;

  const TvDetailsSeasonDetailsGuestStarsData({
    required this.character,
    required this.creditId,
    required this.order,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    this.profilePath,
  });
}