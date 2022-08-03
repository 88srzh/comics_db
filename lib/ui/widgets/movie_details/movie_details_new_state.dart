part of 'movie_details_new_cubit.dart';

// @immutable
class MovieDetailsCubitNewState {
  final String overview;
  final String localeTag;

  const MovieDetailsCubitNewState({
    required this.overview,
    required this.localeTag,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCubitNewState &&
          runtimeType == other.runtimeType &&
          overview == other.overview &&
          localeTag == other.localeTag;

  @override
  int get hashCode => overview.hashCode ^ localeTag.hashCode;

  MovieDetailsCubitNewState copyWith({
    String? overview,
    String? localeTag,
  }) {
    return MovieDetailsCubitNewState(
      overview: overview ?? this.overview,
      localeTag: localeTag ?? this.localeTag,
    );
  }
}

// class MovieDetailsNewInitial extends MovieDetailsNewState {}
