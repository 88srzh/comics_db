// Dart imports:
import 'dart:convert';
import 'dart:io';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/network_client.dart';
import 'package:comics_db_app/domain/entity/account_details.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/entity/movie_response.dart';
import 'package:comics_db_app/domain/entity/people_details.dart';
import 'package:comics_db_app/domain/entity/people_response.dart';
import 'package:comics_db_app/domain/entity/popular_tv_response.dart';
import 'package:comics_db_app/domain/entity/trending_all_response.dart';
import 'package:comics_db_app/domain/entity/tv_details.dart';

const String sixHor = '6h';
enum TimeWindowType { sixHor, day, week }

extension TimeWindowTypeAsString on TimeWindowType {
  String asString() {
    switch (this) {
      case TimeWindowType.week:
        return 'week';
      case TimeWindowType.day:
        return 'day';
      case TimeWindowType.sixHor:
        return '6h';
    }
  }
}

class MovieAndTvApiClient {
  final _networkClient = NetworkClient();

  Future<MovieResponse> popularMovie(
    int page,
    String locale,
    String apiKey,
  ) async {
    MovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieResponse.fromJson(jsonMap);
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

  Future<PeopleDetails> popularPeopleDetails(int personId, String locale) async {
    PeopleDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PeopleDetails.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/person/$personId',
      parser,
      <String, dynamic>{
        'append_to_response': 'credits, video',
        'api_key': Configuration.apiKey,
        'language': locale,
      },
    );
    return result;
  }

  Future<PeopleResponse> popularPeople(
    int page,
    String locale,
    String apiKey,
  ) {
    PeopleResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PeopleResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/person/popular',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<MovieResponse> topRatedMovie(
    int page,
    String locale,
    String apiKey,
  ) {
    MovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/movie/top_rated',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<MovieResponse> upcomingMovie(
    int page,
    String locale,
    String apiKey,
  ) {
    MovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieResponse.fromJson(jsonMap);
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

  Future<MovieResponse> nowPlayingMovie(
    int page,
    String locale,
    String apiKey,
  ) {
    MovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/movie/now_playing',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  Future<MovieResponse> favoriteMoviesList(
    int page,
    String locale,
    String apiKey,
    String? sessionId,
    int? accountId,
    int totalResults,
  ) {
    MovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/account/$accountId/favorite/movies',
      parser,
      <String, dynamic>{
        'page': page.toString(),
        'language': locale,
        'api_key': Configuration.apiKey,
        'session_id': sessionId,
        'totalResults': totalResults.toString(),
      },
    );
    return result;
  }

  Future<PopularTVResponse> favoriteTvsList(
    int page,
    String locale,
    String apiKey,
    String? sessionId,
    int? accountId,
    int totalResults,
  ) {
    PopularTVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTVResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/account/$accountId/favorite/tv',
      parser,
      <String, dynamic>{
        'page': page.toString(),
        'language': locale,
        'api_key': Configuration.apiKey,
        'session_id': sessionId,
        'totalResults': totalResults.toString(),
      },
    );
    return result;
  }

  // Future<PopularAndTopRatedMovieResponse> similarMovie(
  //     int movieId, int page, String locale, String apiKey) {
  //   PopularAndTopRatedMovieResponse parser(dynamic json) {
  //     final jsonMap = json as Map<String, dynamic>;
  //     final response = PopularAndTopRatedMovieResponse.fromJson(jsonMap);
  //     return response;
  //   }
  //
  //   final result = _networkClient.get(
  //     '/movie/$movieId/similar',
  //     parser,
  //     <String, dynamic>{
  //       'api_key': Configuration.apiKey,
  //       'page': page.toString(),
  //       'language': locale,
  //       // 'movieId': movieId.toString(),
  //     },
  //   );
  //   return result;
  // }

  Future<PeopleResponse> searchPeople(
    int page,
    String locale,
    String query,
    String apiKey,
  ) async {
    PeopleResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PeopleResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get('/search/person', parser, <String, dynamic>{
      'api_key': Configuration.apiKey,
      'page': page.toString(),
      'language': locale,
      'query': query,
      'include_adult': true.toString(),
    });
    return result;
  }

  Future<MovieResponse> searchMovie(
    int page,
    String locale,
    String query,
    String apiKey,
  ) async {
    MovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieResponse.fromJson(jsonMap);
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

  Future<bool> isFavoriteTv(int tvId, String sessionId) async {
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

  Future<PopularTVResponse> topRatedTvs(
    int page,
    String locale,
    String apiKey,
  ) {
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

  Future<PopularTVResponse> airingTodayTvs(
    int page,
    String locale,
    String apiKey,
  ) {
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

  Future<PopularTVResponse> onTheAirTvs(
    int page,
    String locale,
    String apiKey,
  ) {
    PopularTVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularTVResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get('/tv/on_the_air', parser, <String, dynamic>{
      'api_key': Configuration.apiKey,
      'page': page.toString(),
      'language': locale,
    });
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

  Future<PopularTVResponse> popularTV(int page, String locale, String apiKey) async {
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

  Future<PopularTVResponse> searchTV(int page, String locale, String query, String apiKey) async {
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

  Future<TrendingAllResponse> trendingAll(int page, String locale, String timeWindow, String apiKey) async {
    TrendingAllResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TrendingAllResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      // сюда входят фильмы, сериалы и люди(person)
      '/trending/all/$timeWindow',
      parser,
      <String, dynamic>{
        'page': page.toString(),
        'language': locale,
        'time_window': timeWindow,
        'api_key': Configuration.apiKey,
      },
    );
    return result;
  }


  Future<TrendingAllResponse> trendingMovies(int page, String locale, String timeWindow, String apiKey) async {
    TrendingAllResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TrendingAllResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/trending/movie/$timeWindow',
      parser,
      <String, dynamic>{
        'page': page.toString(),
        'language': locale,
        'time_window': timeWindow,
        'api_key': Configuration.apiKey,
      },
    );
    return result;
  }

  Future<TrendingAllResponse> trendingTv(int page, String locale, String timeWindow, String apiKey) async {
    TrendingAllResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TrendingAllResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/trending/tv/$timeWindow',
      parser,
      <String, dynamic>{
        'page': page.toString(),
        'language': locale,
        'time_window': timeWindow,
        'api_key': Configuration.apiKey,
      },
    );
    return result;
  }

  Future<PeopleResponse> trendingPeople(int page, String locale, String timeWindow, String apiKey) async {
    PeopleResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PeopleResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/trending/person/$timeWindow',
      parser,
      <String, dynamic>{
        'page': page.toString(),
        'language': locale,
        'time_window': timeWindow,
        'api_key': Configuration.apiKey,
      },
    );
    return result;
  }

  Future<AccountDetails> accountDetails(String sessionId) async {
    AccountDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = AccountDetails.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get('/account', parser, <String, dynamic>{
      'api_key': Configuration.apiKey,
      'session_id': sessionId,
    });
    return result;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder).toList().then((value) {
      final result = value.join();
      return result;
    }).then<dynamic>((v) => json.decode(v));
  }
}
