import 'package:comics_db_app/ui/widgets/watchlist/components/watchlist_data.dart';

class WatchlistCubitState {
  final List<WatchlistData> watchlistList;
  final String localeTag;

  const WatchlistCubitState({
    required this.watchlistList,
    required this.localeTag,
  });

  WatchlistCubitState copyWith({
    List<WatchlistData>? watchlistList,
    String? localeTag,
  }) {
    return WatchlistCubitState(
      watchlistList: watchlistList ?? this.watchlistList,
      localeTag: localeTag ?? this.localeTag,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is WatchlistCubitState && runtimeType == other.runtimeType && watchlistList == other.watchlistList;

  @override
  int get hashCode => watchlistList.hashCode;
}
