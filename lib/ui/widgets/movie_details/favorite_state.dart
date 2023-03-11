import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable

class FavoriteState extends Equatable {
  final FavoriteData favoriteData;

  const FavoriteState({required this.favoriteData});

  @override
  List<Object?> get props => [favoriteData];

  FavoriteState copyWith({
    FavoriteData? favoriteData,
  }) {
    return FavoriteState(
      favoriteData: favoriteData ?? this.favoriteData,
    );
  }
}