import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/account_api_client.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';
import 'package:comics_db_app/domain/local_entity/movie_details_local.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/people_details_local.dart';

class MovieService {
  final _movieAndTvApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final _accountApiClient = AccountApiClient();

  Future<MovieResponse> popularMovie(int page, String locale) async =>
      _movieAndTvApiClient.popularMovie(page, locale, Configuration.apiKey);

  Future<MovieResponse> topRatedMovie(int page, String locale) async =>
      _movieAndTvApiClient.topRatedMovie(page, locale, Configuration.apiKey);

  Future<MovieResponse> nowPlayingMovie(int page, String locale) async =>
      _movieAndTvApiClient.nowPlayingMovie(page, locale, Configuration.apiKey);

  Future<MovieResponse> upcomingMovie(int page, String locale) async =>
      _movieAndTvApiClient.upcomingMovie(page, locale, Configuration.apiKey);

  Future<MovieResponse> searchMovie(int page, String locale, String query) async =>
      _movieAndTvApiClient.searchMovie(page, locale, query, Configuration.apiKey);

  // may be problem with image in that function
  Future<MovieDetailsLocal> loadMovieDetails({required int movieId, required String locale}) async {
    final movieDetails = await _movieAndTvApiClient.movieDetails(movieId, locale);
    final sessionId = await _sessionDataProvider.getSessionId();
    var isFavorite = false;
    if (sessionId != null) {
      // TODO: pull out isFavorite
      isFavorite = await _movieAndTvApiClient.isFavoriteMovie(movieId, sessionId);
    }
    return MovieDetailsLocal(details: movieDetails, isFavorite: isFavorite);
  }

  Future<PeopleDetailsLocal> loadPeopleDetails({required int id, required String locale}) async {
    final peopleDetails = await _movieAndTvApiClient.popularPeopleDetails(id, locale);
    return PeopleDetailsLocal(details: peopleDetails);
  }

  Future<void> updateFavoriteMovie({required int movieId, required bool isFavorite}) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();

    if (sessionId == null || accountId == null) return;
    await _accountApiClient.markAsFavorite(
      accountId: accountId,
      sessionId: sessionId,
      mediaType: MediaType.movie,
      mediaId: movieId,
      isFavorite: isFavorite,
    );
  }
}
