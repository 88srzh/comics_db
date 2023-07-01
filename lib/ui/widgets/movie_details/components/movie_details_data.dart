// Project imports:
import 'package:comics_db_app/ui/widgets/movie_details/components/actor_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_reviews_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_people_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/recommendations_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/videos_data.dart';

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
  // String trailerKey = '';

  // TODO may be decompose trailerData
  FavoriteData favoriteData = FavoriteData();

  List<List<MovieDetailsMoviePeopleData>> peopleData = const <List<MovieDetailsMoviePeopleData>>[];
  List<MovieDetailsMovieActorData> actorsData = const <MovieDetailsMovieActorData>[];
  List<MovieDetailsRecommendationsData> recommendationsData = const <MovieDetailsRecommendationsData>[];
  List<MovieDetailsVideosData> videosData = const <MovieDetailsVideosData>[];
  List<List<MovieDetailsReviewsData>> reviewsData = const <List<MovieDetailsReviewsData>>[];
}
