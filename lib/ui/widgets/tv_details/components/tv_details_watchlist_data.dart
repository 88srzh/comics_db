import 'package:flutter/material.dart';

class TvDetailsWatchlistData {
  bool isWatchlist;

  IconData get watchlistIcon => isWatchlist ? Icons.bookmark : Icons.bookmark_outline;

  TvDetailsWatchlistData({this.isWatchlist = false});

  TvDetailsWatchlistData copyWith({
    bool? isWatchlist,
  }) {
    return TvDetailsWatchlistData(
      isWatchlist: isWatchlist ?? this.isWatchlist,
    );
  }
}
