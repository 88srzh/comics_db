import 'package:comics_db_app/ui/widgets/watchlist/components/watchlist_data.dart';

class WatchlistCubitState {
  final List<WatchlistData> watchlistList;
  final String localeTag;

  const WatchlistCubitState({
    required this.watchlistList,
    required this.localeTag,
  });
}