import 'package:flutter/material.dart';

class TvDetailsPosterData {
  final String? posterPath;
  final String? backdropPath;
  final IconData favoriteIcon;

  TvDetailsPosterData({
    this.posterPath,
    this.backdropPath,
    this.favoriteIcon = Icons.favorite_outline,
  });
}
