// Project imports:
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_created_by_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_actor_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_content_ratings_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_network_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_people_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_recommendations_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_trailer_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_videos_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_watchlist_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_favorite_data.dart';

class TvDetailsData {
  String name = '';
  String posterPath = '';
  String backdropPath = '';
  String tagline = '';
  bool isLoading = false;
  String overview = '';
  String genres = '';
  String? firstAirDate = '';
  TvDetailsTrailerData tvTrailedData = TvDetailsTrailerData();
  TvDetailsScoresData tvDetailsScoresData = TvDetailsScoresData(voteCount: 0, popularity: 0);
  List<List<TvDetailsPeopleData>> peopleData = const <List<TvDetailsPeopleData>>[];
  List<TvDetailsActorData> actorsData = const <TvDetailsActorData>[];
  List<TvDetailsRecommendationsData> recommendationsData = const <TvDetailsRecommendationsData>[];
  List<TvDetailsVideosData>? videosData = const <TvDetailsVideosData>[];
  List<List<TvDetailsCreatedByData>> createdByData = const <List<TvDetailsCreatedByData>>[];
  List<TvDetailsContentRatingsData> ratingsData = const <TvDetailsContentRatingsData>[];
  List<TvDetailsNetworkData> networkData = const <TvDetailsNetworkData>[];

  TvFavoriteData favoriteData = TvFavoriteData();
  TvDetailsWatchlistData watchlistData = TvDetailsWatchlistData();
}
