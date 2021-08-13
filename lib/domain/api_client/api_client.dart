import 'dart:convert';
import 'dart:io';

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'http://image.tmbd.org/t/p/w500';
  static const _apiKey = '16257858b79d98176712e6d572638798';

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
        final uri = Uri.parse('$_host$path?api_key=$_apiKey');
        if (parameters != null) {
          return uri.replace(queryParameters: parameters);
        } else {
          return uri;
        }
  }

  Future<String> makeToken() async {
    final url = _makeUri('/authentication/token/new', <String, dynamic>{'api_key': _apiKey});
    final request = await _client.getUrl(url);
    final response = await request.close();
   final json = (await response.jsonDecode()) as Map<String, dynamic>;
    final token = json['request_token'] as String;
    return token;
  }

  Future<String> validateUser({
    required String username,
    required String password,
    required String requestToken
    }) async {
    final url = _makeUri('/authentication/token/validate_with_login', <String, dynamic>{'api_key': _apiKey});
    final parameters = <String, dynamic> {
      'username' : username,
      'password' : password,
      'request_token' : requestToken,
    };
    final  request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final token = json['request_token'] as String;
    return token;
  }

  Future<String> makeSession({
    required String requestToken
    }) async {
      final url = _makeUri('/authentication/session/new', <String, dynamic>{'api_key': _apiKey});
    final parameters = <String, dynamic> {
      'request_token' : requestToken,
    };
    final  request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    final sessionId = json['session_id'] as String;
    return sessionId;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));

  }
}

  // shikimori
  // static const _apiKey = '7AINHIOa4QS4hJlVdX8l0EaSBnbxAB3h1JT4FJ9UI7k';
  // access token
  // 7AINHIOa4QS4hJlVdX8l0EaSBnbxAB3h1JT4FJ9UI7k
  // refresh token
  // K5MkVnDh6HAO5BauUZH1AqVaIGfdmJRNYnAxljS2Y94
