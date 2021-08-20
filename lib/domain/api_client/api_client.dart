import 'dart:convert';
import 'dart:io';

import 'package:comics_db_app/domain/entity/popular_movie_response.dart';

/*
1. нет сети
2. нет ответа, таймаут соединения

3. сервер недоступен
4. сервер не может обработать запрашиваемый запрос
5. сервер ответил не то, что мы ожидали

6. сервер ответил ожидаемой ошибкой
*/

enum ApiClientExceptionType {
  network, auth, other
}
class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);

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
    T Function(dynamic json) parser,
    [Map<String, dynamic>? parameters,
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
  }
}

Future<T> _post<T>(
  String path,
  Map<String, dynamic> bodyParameters,
  T Function(dynamic json) parser,
  [Map<String, dynamic>? urlParameters,
  ]) async {
  try {
    final url = _makeUri(path, urlParameters);
    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(bodyParameters));
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
  }
}

  Future<String> _makeToken() async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    };
    final result = _get('/authentication/token/new', parser, <String, dynamic>{'api_key': _apiKey},);
    return result;
}

  Future<PopularMovieResponse> popularMovie(int page, String locale) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularMovieResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/movie/popular',
      parser,
      <String, dynamic>{
        'api_key': _apiKey,
        'page': page.toString(),
        'language': locale,
        },);
    return result;
}

  Future<String> _validateUser({
      required String username,
      required String password,
      required String requestToken
      }) async {
       final parser = (dynamic json) {
        final jsonMap = json as Map<String, dynamic>;
        final token = jsonMap['request_token'] as String;
        return token;
        };
       final parameters = <String, dynamic>{
        'username': username,
        'password': password,
        'request_token': requestToken};
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
        final sessionId = json['session_id'] as String;
          return sessionId;
        };
       final parameters = <String, dynamic>{
        'request_token': requestToken};
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
      final status = json['status_code'];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw ApiClientException(ApiClientExceptionType.auth);
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
