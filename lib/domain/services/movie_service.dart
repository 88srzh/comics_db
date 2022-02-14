import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/popular_and_top_rated_movie_response.dart';

class MovieService {
  final _movieApiClient = MovieAndTvApiClient();

  Future<PopularAndTopRatedMovieResponse> popularAndTopMovie(
          int page, String locale) async =>
      _movieApiClient.popularMovie(page, locale, Configuration.apiKey);

  Future<PopularAndTopRatedMovieResponse> searchMovie(
          int page, String locale, String query) async =>
      _movieApiClient.searchMovie(page, locale, query, Configuration.apiKey);
}
