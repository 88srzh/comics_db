import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_season_details_crew_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_season_details_guest_stars_data.dart';

class TvDetailsSeasonDetailsData {
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
  final String stillPath;
  final double voteAverage;
  final int voteCount;
  final List<TvDetailsSeasonDetailsCrewData> crew;
  final List<TvDetailsSeasonDetailsGuestStarsData> guestStars;

  const TvDetailsSeasonDetailsData({
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
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
    required this.crew,
    required this.guestStars,
  });
}