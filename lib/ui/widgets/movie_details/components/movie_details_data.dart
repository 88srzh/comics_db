// Project imports:
import 'package:comics_db_app/ui/widgets/movie_details/components/actor_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/external_ids_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_all_videos_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_reviews_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_similar_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/collection_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_people_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/recommendations_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_videos_data.dart';

class MovieDetailsData {
  int id = 0;
  String title = '';
  String tagline = '';
  bool isLoading = true;
  String overview = '';
  String? posterPath = '';
  String? backdropPath = '';
  int voteCount = 0;
  double popularity = 0;
  String summary = '';
  String releaseDate = '';
  String genres = '';
  double? voteAverage = 0;
  String? facebook = '';

  FavoriteData favoriteData = FavoriteData();

  List<List<MovieDetailsMoviePeopleData>> peopleData = const <List<MovieDetailsMoviePeopleData>>[];
  List<MovieDetailsMovieActorData> actorsData = const <MovieDetailsMovieActorData>[];
  List<MovieDetailsRecommendationsData> recommendationsData = const <MovieDetailsRecommendationsData>[];
  List<MovieDetailsVideosData>? videosData = const <MovieDetailsVideosData>[];
  List<MovieDetailsAllVideosData> allVideosData = const <MovieDetailsAllVideosData>[];
  List<List<MovieDetailsReviewsData>> reviewsData = const <List<MovieDetailsReviewsData>>[];
  List<MovieDetailsSimilarData> similarData = const <MovieDetailsSimilarData>[];
  List<MovieDetailsExternalIdsData> externalIds = const <MovieDetailsExternalIdsData>[];
  List<BelongsToCollectionData> collectionData = const <BelongsToCollectionData>[];
}
