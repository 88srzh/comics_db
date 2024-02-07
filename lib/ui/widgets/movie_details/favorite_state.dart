import 'package:comics_db_app/ui/widgets/movie_details/components/movie_favorite_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable

class FavoriteState extends Equatable {
  final MovieFavoriteData favoriteData;

  const FavoriteState({required this.favoriteData});

  @override
  List<Object?> get props => [favoriteData];

  FavoriteState copyWith({
    MovieFavoriteData? favoriteData,
  }) {
    return FavoriteState(
      favoriteData: favoriteData ?? this.favoriteData,
    );
  }
}