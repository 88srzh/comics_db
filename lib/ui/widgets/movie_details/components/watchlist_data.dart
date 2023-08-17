import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WatchlistData {
  bool isWatchlist;
  IconData get watchlistIcon => isWatchlist ? Icons.bookmark : Icons.bookmark_outline;

  WatchlistData({this.isWatchlist = false});

  WatchlistData copyWith({
    bool? isWatchlist,
  }) {
    return WatchlistData(
      isWatchlist: isWatchlist ?? this.isWatchlist,
    );
  }
}
