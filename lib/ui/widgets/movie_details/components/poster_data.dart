import 'package:flutter/material.dart';

class MovieDetailsPosterData {
  final String? posterPath;
  final String? tagline;
  final String? backdropPath;
  final bool isFavorite;

  IconData get favoriteIcon => isFavorite ? Icons.favorite : Icons.favorite_outline;
  String title;
  final double? voteAverage;
  int voteCount;
  double popularity;

  MovieDetailsPosterData({
    this.posterPath,
    this.backdropPath,
    this.isFavorite = false,
    required this.title,
    this.tagline,
    this.voteAverage,
    required this.voteCount,
    required this.popularity,
  });

  MovieDetailsPosterData copyWith({
    String? posterPath,
    String? backdropPath,
    bool? isFavorite,
    String? title,
    String? tagline,
    double? voteAverage,
    int? voteCount,
    double? popularity,
  }) {
    return MovieDetailsPosterData(
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      isFavorite: isFavorite ?? this.isFavorite,
      voteAverage: voteAverage ?? this.voteAverage,
      title: title ?? this.title,
      tagline: tagline ?? this.tagline,
      voteCount: voteCount ?? this.voteCount,
      popularity: popularity ?? this.popularity,
    );
  }
}
