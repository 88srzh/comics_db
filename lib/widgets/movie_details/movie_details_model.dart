import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:flutter/cupertino.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final int movieId;
  final Locale _locale;

  MovieDetailsModel(this.movieId, this._locale);

  Future<void> loadMovieDetails() async {
    _apiClient.movieDetails(movieId, locale);

  }
}