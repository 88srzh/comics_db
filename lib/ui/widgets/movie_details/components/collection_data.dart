class BelongsToCollectionData {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  const BelongsToCollectionData({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });
}