// Project imports:
import 'package:comics_db_app/domain/api_client/account_api_client.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_local.dart';

class TvService {
  final _tvApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final _accountApiClient = AccountApiClient();

  Future<TvDetailsLocal> loadTvDetails({required int tvId, required String locale}) async {
    final tvDetails = await _tvApiClient.tvDetails(tvId, locale);
    final sessionId = await _sessionDataProvider.getSessionId();
    var isFavorite = false;
    if (sessionId != null) {
      isFavorite = await _tvApiClient.isFavoriteTV(tvId, sessionId);
    }
    return TvDetailsLocal(details: tvDetails, isFavorite: isFavorite);
  }

  Future<void> updateFavoriteTvs({required int tvId, required bool isFavorite}) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();

    if (sessionId == null || accountId == null) return;
    await _accountApiClient.markAsFavorite(
      accountId: accountId,
      sessionId: sessionId,
      mediaType: MediaType.tv,
      mediaId: tvId,
      isFavorite: isFavorite,
    );
  }
}