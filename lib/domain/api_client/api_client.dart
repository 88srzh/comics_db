import 'dart:convert';
import 'dart:io';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/entity/popular_and_top_rated_movie_response.dart';
import 'package:comics_db_app/domain/entity/popular_tv_response.dart';
import 'package:comics_db_app/domain/entity/trending_all_response.dart';
import 'package:comics_db_app/domain/entity/tv_details.dart';
import 'package:comics_db_app/domain/entity/upcoming_movie_response.dart';

/*
1. нет сети
2. нет ответа, таймаут соединения

3. сервер недоступен
4. сервер не может обработать запрашиваемый запрос
5. сервер ответил не то, что мы ожидали

6. сервер ответил ожидаемой ошибкой
*/

enum ApiClientExceptionType { network, auth, other, sessionExpired }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

enum MediaType {movie, tv}

extension MediaTypeAsString on MediaType {
  String asString() {
    switch (this) {
      case MediaType.movie: return 'movie';
      case MediaType.tv: return 'tv';
    }
  }
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = '16257858b79d98176712e6d572638798';

  static String imageUrl(String path) => _imageUrl + path;

  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
        username: username, password: password, requestToken: token);
    final sessionId = await _makeSession(requestToken: validToken);
    return sessionId;
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<T> _get<T>(
    String path,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? parameters,
  ]) async {
    final url = _makeUri(path, parameters);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
      // if (ApiClientExceptionType.other == ApiClientExceptionType.other)
      //   => Navigator.pushReplacementNamed(context, MainNavigationRouteNames.networkConnectionError);
    }
  }

  Future<T> _post<T>(
    String path,
    Map<String, dynamic> bodyParameters,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? urlParameters,
  ]) async {
    try {
      final url = _makeUri(path, urlParameters);
      final request = await _client.postUrl(url);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(bodyParameters));
      final response = await request.close();
      if (response.statusCode == 404) {
        print('not found - 404');
      }
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<String> _makeToken() async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    };
    final result = _get(
      '/authentication/token/new',
      parser,
      <String, dynamic>{'api_key': _apiKey},
    );
    return result;
  }

  Future<int> getAccountInfo(String sessionId) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = jsonMap['id'] as int;
      return result;
    };
    final result = _get(
      '/account',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'session_id': sessionId,
        // 'movieId': movieId.toString(),
      },
    );
    return result;
  }

  Future<int> markAsFavorite({
        required int accountId,
        required String sessionId,
        required MediaType mediaType,
        required int mediaId,
        required bool isFavorite,

  }) async {
    final parser = (dynamic json) {
      return 1;
    };
    final parameters = <String, dynamic>{
      'media_type': mediaType.asString(),
      'media_id': mediaId,
      'favorite': isFavorite,
    };
    final result = _post(
      '/account/$accountId/favorite',
      parameters,
      parser,
      <String, dynamic>{'api_key': _apiKey, 'session_id': sessionId},
    );
    return result;
  }

  Future<PopularAndTopRatedMovieResponse> popularMovie(int page, String locale) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/movie/popular',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<PopularAndTopRatedMovieResponse> topRatedMovie(int page, String locale) {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/movie/top_rated',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<PopularTVResponse> topRatedTvs(int page, String locale) {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTVResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/tv/top_rated',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<PopularAndTopRatedMovieResponse> upcomingMovie(int page, String locale) {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/movie/upcoming',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

    Future<PopularAndTopRatedMovieResponse> searchMovie(int page, String locale, String query) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/search/movie',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'page': page.toString(),
        'language': locale,
        'query': query,
        'include_adult': true.toString(),
      },
    );
    return result;
  }

  Future<PopularAndTopRatedMovieResponse> searchUpcomingMovie(int page, String locale, String query) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/search/movie',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'page': page.toString(),
        'language': locale,
        'query': query,
        'include_adult': true.toString(),
      },
    );
    return result;
  }

  Future<MovieDetails> movieDetails(int movieId, String locale) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieDetails.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/movie/$movieId',
      parser,
      <String, dynamic>{
        'append_to_response': 'credits,videos',
        'api_key': _apiKey,
        'language': locale,
        // 'movieId': movieId.toString(),
      },
    );
    return result;
  }


  // TODO can add watchlist and rated, look at:
  // https://developers.themoviedb.org/3/movies/get-movie-account-states
  Future<bool> isFavoriteMovie(int movieId, String sessionId) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = jsonMap['favorite'] as bool;
      return result;
    };
    final result = _get(
      '/movie/$movieId/account_states',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'session_id': sessionId,
      },
    );
    return result;
  }

  Future<TVDetails> tvDetails(int tvId, String locale) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TVDetails.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/tv/$tvId',
      parser,
      <String, dynamic>{
        'append_to_response': 'credits,videos',
        'api_key': _apiKey,
        'language': locale,
      },
    );
    return result;
  }

  Future<bool> isFavoriteTV(int tvId, String sessionId) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = jsonMap['favorite'] as bool;
      return result;
    };
    final result = _get(
      '/tv/$tvId/account_states',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'session_id': sessionId,
      },
    );
    return result;
  }

  Future<PopularTVResponse> popularTV(int page, String locale) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTVResponse.fromJson(jsonMap);
      return response;
    };
    final tvResult = _get(
      '/tv/popular',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return tvResult;
  }

  Future<PopularTVResponse> searchTV(int page, String locale, String query) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTVResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/search/tv',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'page': page.toString(),
        'language': locale,
        'query': query,
        'include_adult': true.toString(),
      },
    );
    return result;
  }

    Future<TrendingAllResponse> trendingAll(int page, String? mediaType, String? timeWindow) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TrendingAllResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      // сюда входят фильмы, сериалы и люди(person)
      '/trending/$mediaType/$timeWindow',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'page': page.toString(),
        'media_type': mediaType,
        'time_window': timeWindow,
      },
    );
    return result;
  }

  Future<String> _validateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    };
    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken
    };
    final result = _post(
      '/authentication/token/validate_with_login',
      parameters,
      parser,
      <String, dynamic>{'api_key': _apiKey},
    );
    return result;
  }

  Future<String> _makeSession({required String requestToken}) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final sessionId = jsonMap['session_id'] as String;
      return sessionId;
    };
    final parameters = <String, dynamic>{'request_token': requestToken};
    final result = _post(
      '/authentication/session/new',
      parameters,
      parser,
      <String, dynamic>{'api_key': _apiKey},
    );
    return result;
  }

  void _validateResponse(HttpClientResponse response, dynamic json) {
    if (response.statusCode == 401) {
      final dynamic status = json['status_code'];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw ApiClientException(ApiClientExceptionType.auth);
      } else if (code == 3) {
        throw ApiClientException(ApiClientExceptionType.sessionExpired);

      } else {
        throw ApiClientException(ApiClientExceptionType.other);
      }
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        // .then((value) {
        //   final result = value.join();
        //   return result;
        // })
        .then<dynamic>((v) => json.decode(v));
  }
}

/*
status_code:
30 - wrong login/password
7 - invalid api key
33 - invalid request token
*/
  // shikimori
  // static const _apiKey = '7AINHIOa4QS4hJlVdX8l0EaSBnbxAB3h1JT4FJ9UI7k';
  // access token
  // 7AINHIOa4QS4hJlVdX8l0EaSBnbxAB3h1JT4FJ9UI7k
  // refresh token
  // K5MkVnDh6HAO5BauUZH1AqVaIGfdmJRNYnAxljS2Y94
