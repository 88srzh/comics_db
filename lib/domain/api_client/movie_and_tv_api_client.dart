import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/network_client.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/entity/popular_and_top_rated_movie_response.dart';
import 'package:comics_db_app/domain/entity/popular_tv_response.dart';
import 'package:comics_db_app/domain/entity/trending_all_response.dart';
import 'package:comics_db_app/domain/entity/tv_details.dart';

class MovieAndTvApiClient {
  final _networkClient = NetworkClient();

  Future<PopularAndTopRatedMovieResponse> popularMovie(
    int page,
    String locale,
    String apiKey,
  ) async {
    PopularAndTopRatedMovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/movie/popular',
      parser,
      <String, dynamic>{
        'api_key': apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<PopularAndTopRatedMovieResponse> topRatedMovie(
    int page,
    String locale,
    String apiKey,
  ) {
    PopularAndTopRatedMovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/movie/top_rated',
      parser,
      <String, dynamic>{
        'api_key': apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<PopularAndTopRatedMovieResponse> similarMovie(
      int movieId, int page, String locale, String apiKey) {
    PopularAndTopRatedMovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/movie/$movieId/similar',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
        // 'movieId': movieId.toString(),
      },
    );
    return result;
  }

  Future<PopularTVResponse> topRatedTvs(int page, String locale) {
    PopularTVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTVResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/tv/top_rated',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<PopularTVResponse> airingTodayTvs(int page, String locale) {
    PopularTVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTVResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/tv/airing_today',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  // TODO: без apiKey, почему?
  Future<PopularAndTopRatedMovieResponse> upcomingMovie(
      int page, String locale) {
    PopularAndTopRatedMovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/movie/upcoming',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<PopularAndTopRatedMovieResponse> searchMovie(
    int page,
    String locale,
    String query,
    String apiKey,
  ) async {
    PopularAndTopRatedMovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/search/movie',
      parser,
      <String, dynamic>{
        'api_key': apiKey,
        'page': page.toString(),
        'language': locale,
        'query': query,
        'include_adult': true.toString(),
      },
    );
    return result;
  }

  Future<PopularAndTopRatedMovieResponse> searchUpcomingMovie(
      int page, String locale, String query) async {
    PopularAndTopRatedMovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/search/movie',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
        'query': query,
        'include_adult': true.toString(),
      },
    );
    return result;
  }

  Future<MovieDetails> movieDetails(int movieId, String locale) async {
    MovieDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieDetails.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/movie/$movieId',
      parser,
      <String, dynamic>{
        'append_to_response': 'credits,videos',
        'api_key': Configuration.apiKey,
        'language': locale,
        // 'movieId': movieId.toString(),
      },
    );
    return result;
  }

// TODO can add watchlist and rated, look at:
// https://developers.themoviedb.org/3/movies/get-movie-account-states
  Future<bool> isFavoriteMovie(int movieId, String sessionId) async {
    bool parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = jsonMap['favorite'] as bool;
      return result;
    }

    final result = _networkClient.get(
      '/movie/$movieId/account_states',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'session_id': sessionId,
      },
    );
    return result;
  }

  Future<TVDetails> tvDetails(int tvId, String locale) async {
    TVDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TVDetails.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/tv/$tvId',
      parser,
      <String, dynamic>{
        'append_to_response': 'credits,videos',
        'api_key': Configuration.apiKey,
        'language': locale,
      },
    );
    return result;
  }

  Future<bool> isFavoriteTV(int tvId, String sessionId) async {
    bool parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = jsonMap['favorite'] as bool;
      return result;
    }

    final result = _networkClient.get(
      '/tv/$tvId/account_states',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'session_id': sessionId,
      },
    );
    return result;
  }

  Future<PopularTVResponse> popularTV(int page, String locale) async {
    PopularTVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTVResponse.fromJson(jsonMap);
      return response;
    }

    final tvResult = _networkClient.get(
      '/tv/popular',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return tvResult;
  }

  Future<PopularTVResponse> searchTV(
      int page, String locale, String query) async {
    PopularTVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTVResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/search/tv',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
        'query': query,
        'include_adult': true.toString(),
      },
    );
    return result;
  }

  Future<TrendingAllResponse> trendingAll(
      int page, String? mediaType, String? timeWindow) async {
    TrendingAllResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TrendingAllResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      // сюда входят фильмы, сериалы и люди(person)
      '/trending/$mediaType/$timeWindow',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'media_type': mediaType,
        'time_window': timeWindow,
      },
    );
    return result;
  }
}

/*
status_code:
30 - wrong login/password
7 - invalid api key
33 - invalid request token
*/
