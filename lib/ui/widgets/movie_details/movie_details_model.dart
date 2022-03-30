import 'package:comics_db_app/domain/api_client/account_api_client.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/services/auth_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetailsPosterData {
  final String? posterPath;
  final String? backdropPath;
  final IconData favoriteIcon;

  MovieDetailsPosterData({
    this.posterPath,
    this.backdropPath,
    this.favoriteIcon = Icons.favorite_outline,
  });
}

class MovieDetailsTitleAndYearData {
  final String title;
  final String year;

  MovieDetailsTitleAndYearData({
    required this.title,
    required this.year,
  });
}

class MovieDetailsTrailerData {
  final String? trailerKey;

  MovieDetailsTrailerData({this.trailerKey});
}

// TODO fix
class MovieDetailsScoresData {
  final String? voteAverage;
  final int voteCount;
  final double popularity;
  final List? genres;

  MovieDetailsScoresData(
      this.voteAverage, this.voteCount, this.popularity, this.genres);
}

class MovieDetailsData {
  String title = '';
  bool isLoading = true;
  String overview = '';
  MovieDetailsPosterData posterData = MovieDetailsPosterData();
  MovieDetailsTitleAndYearData titleAndYearData =
      MovieDetailsTitleAndYearData(title: '', year: '');
  MovieDetailsTrailerData trailerData =
      MovieDetailsTrailerData();
}

class MovieDetailsModel extends ChangeNotifier {
  final authService = AuthService();
  final _sessionDataProvider = SessionDataProvider();
  final _movieAndTvApiClient = MovieAndTvApiClient();
  final _accountApiClient = AccountApiClient();

  final int movieId;
  final data = MovieDetailsData();
  bool _isFavoriteMovie = false;
  String _locale = '';
  late DateFormat dateFormat;
  Future<void>? Function()? onSessionExpired;
  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;

  bool get isFavoriteMovie => _isFavoriteMovie;

  MovieDetailsModel(this.movieId);

  // String stringFromDate(DateTime? date) => date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    dateFormat = DateFormat.yMMMd(locale);
    updateData(null, false);
    await loadMovieDetails(context);
  }

  Future<void> loadMovieDetails(BuildContext context) async {
    try {
      _movieDetails = await _movieAndTvApiClient.movieDetails(movieId, _locale);
      final sessionId = await _sessionDataProvider.getSessionId();
      if (sessionId != null) {
        _isFavoriteMovie =
            await _movieAndTvApiClient.isFavoriteMovie(movieId, sessionId);
      }
      updateData(_movieDetails, isFavoriteMovie);
    } on ApiClientException catch (e) {
      _handleApiClientException(e, context);
    }
  }

  void updateData(MovieDetails? details, bool isFavorite) {
    data.title = details?.title ?? 'Загрузка...';
    data.isLoading = details == null;
    if (details == null) {
      notifyListeners();
      return;
    }
    data.overview = details.overview ?? 'Нет описания';
    final iconData = isFavorite ? Icons.favorite : Icons.favorite_outline;
    data.posterData = MovieDetailsPosterData(
      backdropPath: details.backdropPath,
      posterPath: details.posterPath,
      favoriteIcon: iconData,
    );
    var year = details.releaseDate?.year.toString();
    year = year != null ? ' ($year)' : '';
    data.titleAndYearData =
        MovieDetailsTitleAndYearData(title: details.title, year: year);
    final videos = details.videos.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
    data.trailerData = MovieDetailsTrailerData(trailerKey: trailerKey);
    notifyListeners();
  }

  Future<void> toggleFavoriteMovie(BuildContext context) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();

    if (sessionId == null || accountId == null) return;

    _isFavoriteMovie = !_isFavoriteMovie;
    notifyListeners();
    try {
      await _accountApiClient.markAsFavorite(
          accountId: accountId,
          sessionId: sessionId,
          mediaType: MediaType.movie,
          mediaId: movieId,
          isFavorite: _isFavoriteMovie);
    } on ApiClientException catch (e) {
      _handleApiClientException(e, context);
    }
  }

  void _handleApiClientException(
      ApiClientException exception, BuildContext context) {
    switch (exception.type) {
      case ApiClientExceptionType.sessionExpired:
        authService.logout();
        MainNavigation.resetNavigation(context);
        break;
      default:
        print(exception);
    }
  }
}
