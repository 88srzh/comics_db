import 'package:comics_db_app/ui/widgets/tv_seasons/components/tv_season_crew_data.dart';
import 'package:comics_db_app/ui/widgets/tv_seasons/components/tv_season_guest_stars_data.dart';

class TvSeasonDetailsData {
  final String airDate;
  final int episodeNumber;
  final String episodeType;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int runtime;
  final int seasonNumber;
  final int showId;
  final String? stillPath;
  final double voteAverage;
  final int voteCount;
  final List<TvSeasonCrewData>? crew;
  final List<TvSeasonGuestStarsData>? guestStars;

  const TvSeasonDetailsData({
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    this.stillPath,
    required this.voteAverage,
    required this.voteCount,
    this.crew,
    this.guestStars,
  });
}