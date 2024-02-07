import 'package:flutter/material.dart';

class TvFavoriteData {
  bool isFavorite;
  IconData get favoriteIcon => isFavorite ? Icons.favorite : Icons.favorite_outline;

  TvFavoriteData({this.isFavorite = false});

  TvFavoriteData copyWith({
    bool? isFavorite,
  }) {
    return TvFavoriteData(
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
