import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/account_api_client.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/popular_and_top_rated_movie_response.dart';

class MovieService {
  final _movieAndTvApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final _accountApiClient = AccountApiClient();

  Future<PopularAndTopRatedMovieResponse> popularMovie(int page, String locale) async =>
      _movieAndTvApiClient.popularMovie(page, locale, Configuration.apiKey);

  Future<PopularAndTopRatedMovieResponse> topRatedMovie(int page, String locale) async =>
      _movieAndTvApiClient.topRatedMovie(page, locale, Configuration.apiKey);

  Future<PopularAndTopRatedMovieResponse> searchMovie(int page, String locale, String query) async =>
      _movieAndTvApiClient.searchMovie(page, locale, query, Configuration.apiKey);


  Future<void> loadMovieDetails() async {
    try {
      final movieDetails = await _movieAndTvApiClient.movieDetails(movieId, _locale);
      final sessionId = await _sessionDataProvider.getSessionId();
      var isFavorite = false;
      if (sessionId != null) {
        isFavorite = await _movieAndTvApiClient.isFavoriteMovie(movieId, sessionId);
      }
      updateData(movieDetails, isFavorite);
    } on ApiClientException catch (e) {
      _handleApiClientException(e, context);
    }
  }
}