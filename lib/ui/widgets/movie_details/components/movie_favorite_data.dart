import 'package:flutter/material.dart';

class MovieFavoriteData {
  bool isFavorite;
  IconData get favoriteIcon => isFavorite ? Icons.favorite : Icons.favorite_outline;

  MovieFavoriteData({this.isFavorite = false});

  MovieFavoriteData copyWith({
    bool? isFavorite,
  }) {
    return MovieFavoriteData(
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
