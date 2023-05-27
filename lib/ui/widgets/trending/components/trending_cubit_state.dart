part of 'trending_cubit.dart';

class TrendingCubitState {
  final String? posterPath;
  final int id;
  final String? releaseDate;

  const TrendingCubitState({
    this.posterPath,
    required this.id,
    this.releaseDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrendingCubitState &&
          runtimeType == other.runtimeType &&
          posterPath == other.posterPath &&
          id == other.id &&
          releaseDate == other.releaseDate;

  @override
  int get hashCode => posterPath.hashCode ^ id.hashCode ^ releaseDate.hashCode;

  TrendingCubitState copyWith({
    String? posterPath,
    int? id,
    String? releaseDate,
  }) {
    return TrendingCubitState(
      posterPath: posterPath ?? this.posterPath,
      id: id ?? this.id,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }
}
