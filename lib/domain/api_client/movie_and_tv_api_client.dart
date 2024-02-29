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
import 'package:comics_db_app/domain/entity/trending_all_response.dart';
import 'package:comics_db_app/domain/entity/tv_details.dart';
import 'package:comics_db_app/domain/entity/tv_response.dart';

// const String sixHor = '6h';

// enum TimeWindowType { sixHor, day, week }

// extension TimeWindowTypeAsString on TimeWindowType {
//   String asString() {
//     switch (this) {
//       case TimeWindowType.week:
//         return 'week';
//       case TimeWindowType.day:
//         return 'day';
//       case TimeWindowType.sixHor:
//         return '6h';
//     }
//   }
// }

class MovieAndTvApiClient {
  final _networkClient = NetworkClient();
  DateTime today = DateTime.now();

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
        'append_to_response': 'credits,video',
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

  Future<MovieResponse> discoverPopularMovie(
    int page,
    String locale,
    String apiKey,
    bool includeAdult,
    bool includeVideo,
    String sortBy,
  ) async {
    MovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/discover/movie',
      parser,
      <String, dynamic>{
        'api_key': apiKey,
        'page': page.toString(),
        'language': locale,
        'include_adult': includeAdult.toString(),
        'include_video': includeVideo.toString(),
        'sort_by': sortBy,
      },
    );
    return result;
  }

  Future<MovieResponse> discoverNowPlayingMovie(
    // TODO need to add with_release_type= 2 or 3, now result = 0
    int page,
    String locale,
    String apiKey,
    bool includeAdult,
    bool includeVideo,
    String sortBy,
    int withReleaseType,
    String releaseDateGte,
    String releaseDateLte,
  ) async {
    MovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/discover/movie',
      parser,
      <String, dynamic>{
        'api_key': apiKey,
        'page': page.toString(),
        'language': locale,
        'include_adult': includeAdult.toString(),
        'include_video': includeVideo.toString(),
        'sort_by': sortBy,
        'with_release_type': withReleaseType.toString(),
        'release_date.lte': releaseDateLte.toString(),
        'release_date.gte': releaseDateGte.toString(),
      },
    );
    return result;
  }

  Future<MovieResponse> discoverTopRatedMovie(
    int page,
    String locale,
    String apiKey,
    bool includeAdult,
    bool includeVideo,
    String sortBy,
    String withoutGenres,
    double voteCountGte,
  ) async {
    MovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/discover/movie',
      parser,
      <String, dynamic>{
        'api_key': apiKey,
        'page': page.toString(),
        'language': locale,
        'include_adult': includeAdult.toString(),
        'include_video': includeVideo.toString(),
        'sort_by': sortBy,
        'without_genres': withoutGenres,
        'vote_count.gte': voteCountGte.toString(),
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

  Future<MovieResponse> watchlistMoviesList(
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
      '/account/$accountId/watchlist/movies',
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

  Future<TVResponse> favoriteTvsList(
    int page,
    String locale,
    String apiKey,
    String? sessionId,
    int? accountId,
    int totalResults,
  ) {
    TVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TVResponse.fromJson(jsonMap);
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

  Future<TVResponse> watchlistTvsList(
    int page,
    String locale,
    String apiKey,
    String? sessionId,
    int? accountId,
    int totalResults,
  ) {
    TVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TVResponse.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get(
      '/account/$accountId/watchlist/tv',
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
        'append_to_response': 'credits,videos,recommendations,external_ids,reviews',
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

  Future<bool> isWatchlistMovie(int movieId, String sessionId) async {
    bool parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = jsonMap['watchlist'] as bool;
      return result;
    }

    final result = _networkClient.get('/movie/$movieId/account_states', parser, <String, dynamic>{
      'api_key': Configuration.apiKey,
      'session_id': sessionId,
    });
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
        'append_to_response': 'credits,videos,recommendations,content_ratings',
        'api_key': Configuration.apiKey,
        'language': locale,
      },
    );
    return result;
  }

  Future<TVResponse> discoverPopularTV(
    int page,
    String locale,
    String apiKey,
    bool includeAdult,
    bool includeNullFirstAirDates,
    String sortBy,
  ) async {
    TVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TVResponse.fromJson(jsonMap);
      return response;
    }

    final tvResult = _networkClient.get('/discover/tv', parser, <String, dynamic>{
      'api_key': Configuration.apiKey,
      'page': page.toString(),
      'language': locale,
      'include_adult': includeAdult.toString(),
      'include_null_first_air_dates': includeNullFirstAirDates.toString(),
      'sort_by': sortBy,
    });
    return tvResult;
  }

  Future<TVResponse> discoverTopRatedTV(
    int page,
    String locale,
    String apiKey,
    bool includeAdult,
    bool includeNullFirstAirDates,
    String sortBy,
    double? voteCountGte,
  ) async {
    TVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TVResponse.fromJson(jsonMap);
      return response;
    }

    final tvResult = _networkClient.get('/discover/tv', parser, <String, dynamic>{
      'api_key': Configuration.apiKey,
      'page': page.toString(),
      'language': locale,
      'include_adult': includeAdult.toString(),
      'include_null_first_air_dates': includeNullFirstAirDates.toString(),
      'sort_by': sortBy,
      'vote_count.gte': voteCountGte.toString(),
    });
    return tvResult;
  }

  Future<TVResponse> discoverAiringTodayTV(
    int page,
    String locale,
    String apiKey,
    bool includeAdult,
    String sortBy,
    String dateTimeMaximum,
    String dateTimeMinimum,
  ) async {
    TVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TVResponse.fromJson(jsonMap);
      return response;
    }

    final tvResult = _networkClient.get('/discover/tv', parser, <String, dynamic>{
      'api_key': Configuration.apiKey,
      'page': page.toString(),
      'language': locale,
      'include_adult': includeAdult.toString(),
      'sort_by': sortBy,
      'air_date.lte': dateTimeMaximum,
      'air_date.gte': dateTimeMinimum,
    });
    return tvResult;
  }

  Future<TVResponse> discoverOnTheAirTodayTV(
    int page,
    String locale,
    String apiKey,
    bool includeAdult,
    String sortBy,
    String dateTimeMaximum,
    int firstAirDateYear,
  ) async {
    TVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TVResponse.fromJson(jsonMap);
      return response;
    }

    final tvResult = _networkClient.get('/discover/tv', parser, <String, dynamic>{
      'api_key': Configuration.apiKey,
      'page': page.toString(),
      'language': locale,
      'include_adult': includeAdult.toString(),
      'sort_by': sortBy,
      'air_date.lte': dateTimeMaximum,
      'first_air_date_year': firstAirDateYear.toString(),
    });
    return tvResult;
  }

  Future<TVResponse> searchTV(int page, String locale, String query, String apiKey) async {
    TVResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TVResponse.fromJson(jsonMap);
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

  Future<TrendingAllResponse> trendingPeople(int page, String locale, String timeWindow, String apiKey) async {
    TrendingAllResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TrendingAllResponse.fromJson(jsonMap);
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
