import 'package:comics_db_app/ui/widgets/tv_episodes/components/tv_episodes_crew_data.dart';
import 'package:comics_db_app/ui/widgets/tv_episodes/components/tv_episodes_guest_stars_data.dart';

class TvEpisodesData {
  String airDate = '';
  List<TvEpisodesCrewData> tvEpisodesCrewData = <TvEpisodesCrewData>[];
  int episodeNumber = 0;
  List<TvEpisodesGuestStarsData> tvEpisodesGuestStarsData = <TvEpisodesGuestStarsData>[];
  String name = '';
  String overview = '';
  int id = 0;
  String productionCode = '';
  int runtime = 0;
  int seasonNumber = 0;
  String? stillPath = '';
  double voteAverage = 0.0;
  int voteCount = 0;
}
