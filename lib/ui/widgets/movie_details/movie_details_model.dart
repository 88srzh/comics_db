import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _sessionDataProvider = SessionDataProvider();
  final _apiClient = ApiClient();

  final int movieId;
  bool _isFavoriteMovie = false;
  String _locale = '';
  late DateFormat _dateFormat;
  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;
  bool get isFavoriteMovie => _isFavoriteMovie;

  MovieDetailsModel(this.movieId);

  // String stringFromDate(DateTime? date) => date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    await loadMovieDetails();
  }

  Future<void> loadMovieDetails() async {
    _movieDetails = await _apiClient.movieDetails(movieId, _locale);
    final sessionId = await _sessionDataProvider.getSessionId();
    if (sessionId != null) {
      _isFavoriteMovie = await _apiClient.isFavoriteMovie(movieId, sessionId);
    }
    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();

    if (sessionId == null || accountId == null) return;

    _isFavoriteMovie = !_isFavoriteMovie;
    notifyListeners();
    try {
      await _apiClient.markAsFavorite(
          accountId: accountId,
          sessionId: sessionId,
          mediaType: MediaType.movie,
          mediaId: movieId,
          isFavorite: _isFavoriteMovie);
    } on  ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.sessionExpired:

          break;
        default:
          print(e);
      }
    }
  }
}