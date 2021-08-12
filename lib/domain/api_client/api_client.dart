import 'dart:convert';
import 'dart:io';

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'http://image.tmbd.org/t/p/w500';
  static const _apiKey = '16257858b79d98176712e6d572638798';

  Future<String> makeToken() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/new?api_key=$_apiKey');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);
    final token = json['request_token'] as String;
    return token;
  }

  // shikimori
  // static const _apiKey = '7AINHIOa4QS4hJlVdX8l0EaSBnbxAB3h1JT4FJ9UI7k';
  // access token
  // 7AINHIOa4QS4hJlVdX8l0EaSBnbxAB3h1JT4FJ9UI7k
  // refresh token
  // K5MkVnDh6HAO5BauUZH1AqVaIGfdmJRNYnAxljS2Y94
}

  // Future<List<Post>> getPost() async {
  //   final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  //   final request = await client.getUrl(url);
  //   final response = await request.close();
  //   final json = await response
  //   .transform(utf8.decoder)
  //   .toList()
  //   .then((value) => value.join())
  //   .then((v) => jsonDecode(v) as List<dynamic>);
  //   final result = json
  //   .map((dynamic e) => Post.fromJson (e as Map<String, dynamic>))
  //   .toList();
  //   return result;
  // }

  // Future<Post> createPost({required String title, required String body}) async {
  //   final url = uri.parse('https://jsonplaceholder.typicode.com/posts');
  //   final parameters = <String, dynamic> {
  //     'title' : title,
  //     'body' : body,
  //     'userId' : 109
  //   };
  //   final request = await client.postUrl(url);
  //   request.header.add('Content-type', 'application/json; charset=UTF-8');
  //   request.write(jsonEncode(parameters));
  //   final response = await request.close();
  //   final string = await response
  //   .transform(utf8.decoder)
  //   .toList()
  //   .then((value) => value.join());
  //   final json = jsonDecode(string) as Map<String, dynamic>;
  //   final post = Post.fromJson(json);
  //   return post;
  // }