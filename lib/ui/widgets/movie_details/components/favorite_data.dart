import 'package:flutter/material.dart';

class FavoriteData {
  bool isFavorite;
  IconData get favoriteIcon => isFavorite ? Icons.favorite : Icons.favorite_outline;

  FavoriteData({this.isFavorite = false});

  FavoriteData copyWith({
    bool? isFavorite,
  }) {
    return FavoriteData(
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
