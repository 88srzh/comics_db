import 'package:comics_db_app/domain/api_client/account_api_client.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/tv_details.dart';
import 'package:comics_db_app/domain/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TvDetailsPosterData {
  final String? posterPath;
  final String? backdropPath;
  final IconData favoriteIcon;

  TvDetailsPosterData({
    this.posterPath,
    this.backdropPath,
    this.favoriteIcon = Icons.favorite_outline,
  });
}

class TvDetailsNameData {
  final String name;
  final String tagline;

  TvDetailsNameData({required this.name, required this.tagline});
}

class TvDetailsTrailerData {
  final String? trailerKey;

  TvDetailsTrailerData({this.trailerKey});
}

class TvDetailsScoresData {
  final String? voteAverage;
  final int voteCount;
  final double popularity;

  TvDetailsScoresData({
    this.voteAverage,
    required this.voteCount,
    required this.popularity,
  });
}

class TvDetailsData {
  String name = '';
  String tagline = '';
  bool isLoading = true;
  String overview = '';
  String genres = '';
  TvDetailsPosterData tvDetailsPosterData = TvDetailsPosterData();
  TvDetailsNameData tvNameData = TvDetailsNameData(name: '', tagline: '');
  TvDetailsTrailerData tvTrailedData = TvDetailsTrailerData();
  TvDetailsScoresData tvDetailsScoresData = TvDetailsScoresData(voteCount: 0, popularity: 0);
}

class TvDetailsModel extends ChangeNotifier {
  final authService = AuthService();
  final _sessionDataProvider = SessionDataProvider();
  final _movieAndTvApiClient = MovieAndTvApiClient();
  final _accountApiClient = AccountApiClient();

  final int tvId;
  final tvData = TvDetailsData();
  bool _isFavoriteTV = false;
  String _locale = '';
  late DateFormat _dateFormat;
  Future<void>? Function()? onSessionExpired;
  TVDetails? _tvDetails;

  TVDetails? get tvDetails => _tvDetails;

  bool get isFavoriteTV => _isFavoriteTV;

  TvDetailsModel(this.tvId);

  String stringFromDate(DateTime? date) => date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMd(locale);
    updateData(null, false);
    await loadTVDetails(context);
  }

  Future<void> loadTVDetails(BuildContext context) async {
    try {
      _tvDetails = await _movieAndTvApiClient.tvDetails(tvId, _locale);
      final sessionId = await _sessionDataProvider.getSessionId();
      if (sessionId != null) {
        _isFavoriteTV = await _movieAndTvApiClient.isFavoriteTV(tvId, sessionId);
      }
      updateData(_tvDetails, isFavoriteTV);
    } on ApiClientException catch (e) {
      _handleApiClientException(e);
    }
  }

  void updateData(TVDetails? details, bool isFavorite) {
    tvData.name = details?.name ?? 'No name';
    tvData.tagline = details?.tagline ?? 'No tagline';
    tvData.isLoading = details == null;
    if (details == null) {
      notifyListeners();
      return;
    }
    // TODO may be overview null?
    tvData.overview = details.overview;
    final iconData = isFavorite ? Icons.favorite : Icons.favorite_outline;
    tvData.tvDetailsPosterData = TvDetailsPosterData(
      backdropPath: details.backdropPath,
      posterPath: details.posterPath,
      favoriteIcon: iconData,
    );
    tvData.tvNameData = TvDetailsNameData(name: details.name, tagline: details.tagline);
    final videos = details.videos.results.where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
    tvData.tvTrailedData = TvDetailsTrailerData(trailerKey: trailerKey);
    tvData.tvDetailsScoresData = TvDetailsScoresData(
      voteCount: details.voteCount,
      popularity: details.popularity,
      voteAverage: details.voteAverage.toString(),
    );
    tvData.genres = makeGenres(details);
    notifyListeners();
  }

  // TODO вынести в отдельный файл (дубликат из муви)
  String makeGenres(TVDetails details) {
    var texts = <String>[];
    if (details.genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genr in details.genres) {
        genresNames.add(genr.name);
      }
      texts.add(genresNames.join(', '));
    }
    return texts.join(' ');
  }

  Future<void> toggleFavoriteTV() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();

    if (sessionId == null || accountId == null) return;

    _isFavoriteTV = !_isFavoriteTV;
    notifyListeners();
    try {
      await _accountApiClient.markAsFavorite(
          accountId: accountId, sessionId: sessionId, mediaType: MediaType.tv, mediaId: tvId, isFavorite: _isFavoriteTV);
    } on ApiClientException catch (e) {
      _handleApiClientException(e);
    }
  }

  void _handleApiClientException(ApiClientException exception) {
    switch (exception.type) {
      case ApiClientExceptionType.sessionExpired:
        onSessionExpired?.call();
        break;
      default:
        print(exception);
    }
  }
}
