import 'package:comics_db_app/domain/api_client/account_api_client.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/tv_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TvDetailsModel extends ChangeNotifier {
  final _sessionDataProvider = SessionDataProvider();
  final _movieAndTvApiClient = MovieAndTvApiClient();
  final _accountApiClient = AccountApiClient();
  final int tvId;
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
    await loadTVDetails();
  }

  Future<void> loadTVDetails() async {
    try {
      _tvDetails = await _movieAndTvApiClient.tvDetails(tvId, _locale);
      final sessionId = await _sessionDataProvider.getSessionId();
      if (sessionId != null) {
        _isFavoriteTV = await _movieAndTvApiClient.isFavoriteTV(tvId, sessionId);
      }
      notifyListeners();
    } on ApiClientException catch (e) {
      _handleApiClientException(e);
    }
  }

  Future<void> toggleFavoriteTV() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();

    if (sessionId == null || accountId == null) return;

    _isFavoriteTV = !_isFavoriteTV;
    notifyListeners();
    try {
      await _accountApiClient.markAsFavorite(
          accountId: accountId,
          sessionId: sessionId,
          mediaType: MediaType.tv,
          mediaId: tvId,
          isFavorite: _isFavoriteTV
      );
    } on  ApiClientException catch (e) {
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