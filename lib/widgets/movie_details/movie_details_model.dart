import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final int movieId;
  late final String _locale;
  late DateFormat _dateFormat;
  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;

  MovieDetailsModel(this.movieId);

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    await loadMovieDetails();
  }

  Future<void> loadMovieDetails() async {
    _movieDetails = await _apiClient.movieDetails(movieId, _locale);
    notifyListeners();

  }
}