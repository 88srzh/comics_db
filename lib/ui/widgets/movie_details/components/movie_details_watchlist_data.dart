// Flutter imports:
import 'package:flutter/material.dart';

class MovieDetailsWatchlistData {
  bool isWatchlist;
  IconData get watchlistIcon => isWatchlist ? Icons.bookmark : Icons.bookmark_outline;

  MovieDetailsWatchlistData({this.isWatchlist = false});

  MovieDetailsWatchlistData copyWith({
    bool? isWatchlist,
  }) {
    return MovieDetailsWatchlistData(
      isWatchlist: isWatchlist ?? this.isWatchlist,
    );
  }
}
