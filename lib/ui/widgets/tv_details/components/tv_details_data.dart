import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_actor_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_people_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_recommendations_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_trailer_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_videos_data.dart';

class TvDetailsData {
  String name = '';
  String posterPath = '';
  String backdropPath = '';
  String tagline = '';
  bool isLoading = true;
  String overview = '';
  String genres = '';
  TvDetailsTrailerData tvTrailedData = TvDetailsTrailerData();
  TvDetailsScoresData tvDetailsScoresData = TvDetailsScoresData(voteCount: 0, popularity: 0);
  List<List<TvDetailsPeopleData>> peopleData = const <List<TvDetailsPeopleData>>[];
  List<TvDetailsActorData> actorsData = const <TvDetailsActorData>[];
  List<TvDetailsRecommendationsData> recommendationsData = const <TvDetailsRecommendationsData>[];
  List<TvDetailsVideosData>? videosData = const <TvDetailsVideosData>[];

  FavoriteData favoriteData = FavoriteData();
}
