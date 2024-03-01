// Project imports:
import 'package:comics_db_app/domain/entity/movie_details_keywords.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/actor_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/external_ids_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_all_videos_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_keywords_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_reviews_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_similar_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/collection_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_people_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_favorite_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/recommendations_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_videos_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_watchlist_data.dart';

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
  String runtime = '';
  String releaseDate = '';
  String genres = '';
  double? voteAverage = 0;
  String? facebookId = '';
  String? imdb = '';
  String? wikidataId = '';
  String? instagramId = '';
  String? twitterId = '';
  String? homepage = '';
  String originalLanguage = '';
  int budget = 0;
  int revenue = 0;
  String status = '';

  MovieFavoriteData favoriteData = MovieFavoriteData();
  MovieDetailsWatchlistData watchlistData = MovieDetailsWatchlistData();
  MovieDetailsExternalIdsData externalIds = MovieDetailsExternalIdsData();

  List<List<MovieDetailsMoviePeopleData>> peopleData = const <List<MovieDetailsMoviePeopleData>>[];
  List<MovieDetailsMovieActorData> actorsData = const <MovieDetailsMovieActorData>[];
  List<MovieDetailsRecommendationsData> recommendationsData = const <MovieDetailsRecommendationsData>[];
  List<MovieDetailsVideosData>? videosData = const <MovieDetailsVideosData>[];
  List<MovieDetailsAllVideosData> allVideosData = const <MovieDetailsAllVideosData>[];
  List<MovieDetailsReviewsData> reviewsData = const <MovieDetailsReviewsData>[];
  List<MovieDetailsSimilarData> similarData = const <MovieDetailsSimilarData>[];
  List<BelongsToCollectionData> collectionData = const <BelongsToCollectionData>[];
  List<MovieDetailsKeywordsData> keywordsData = const <MovieDetailsKeywordsData>[];
}
