part of 'movie_details_new_cubit.dart';

@immutable
class MovieDetailsCubitNewState {
  final String overview;
  final String localeTag;
  final String posterPath;
  final String title;
  final String tagline;
  final int voteCount;
  final double popularity;
  final String? releaseDate;

  const MovieDetailsCubitNewState({
    required this.overview,
    required this.localeTag,
    required this.posterPath,
    required this.title,
    required this.tagline,
    required this.voteCount,
    required this.popularity,
    required this.releaseDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCubitNewState &&
          runtimeType == other.runtimeType &&
          overview == other.overview &&
          localeTag == other.localeTag &&
          posterPath == other.posterPath &&
          title == other.title &&
          tagline == other.tagline &&
          voteCount == other.voteCount &&
          popularity == other.popularity &&
          releaseDate == other.releaseDate;

  @override
  int get hashCode => overview.hashCode ^ localeTag.hashCode;

  MovieDetailsCubitNewState copyWith({
    String? overview,
    String? localeTag,
    String? posterPath,
    String? title,
    String? tagline,
    int? voteCount,
    double? popularity,
    String? releaseDate,
  }) {
    return MovieDetailsCubitNewState(
      overview: overview ?? this.overview,
      localeTag: localeTag ?? this.localeTag,
      posterPath: posterPath ?? this.posterPath,
      title: title ?? this.title,
      tagline: tagline ?? this.tagline,
      voteCount: voteCount ?? this.voteCount,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }
}
