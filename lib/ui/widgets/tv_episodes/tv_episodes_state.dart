part of 'tv_episodes_cubit.dart';

class TvEpisodesCubitState {
  final String airDate;
  final List<TvEpisodesCrewData> crew;
  final int episodeNumber;
  final List<TvEpisodesGuestStarsData> guestStars;
  final String name;
  final String overview;
  final int id;
  final String productionCode;
  final int runtime;
  final int seasonNumber;
  final String? stillPath;
  final double voteAverage;
  final int voteCount;

  const TvEpisodesCubitState({
    required this.airDate,
    required this.crew,
    required this.episodeNumber,
    required this.guestStars,
    required this.name,
    required this.overview,
    required this.id,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TvEpisodesCubitState && runtimeType == other.runtimeType && episodeNumber == other.episodeNumber;

  @override
  int get hashCode => episodeNumber.hashCode;

  TvEpisodesCubitState copyWith({
    String? airDate,
    List<TvEpisodesCrewData>? crew,
    int? episodeNumber,
    List<TvEpisodesGuestStarsData>? guestStars,
    String? name,
    String? overview,
    int? id,
    String? productionCode,
    int? runtime,
    int? seasonNumber,
    String? stillPath,
    double? voteAverage,
    int? voteCount,
  }) {
    return TvEpisodesCubitState(
      airDate: airDate ?? this.airDate,
      crew: crew ?? this.crew,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      guestStars: guestStars ?? this.guestStars,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      id: id ?? this.id,
      productionCode: productionCode ?? this.productionCode,
      runtime: runtime ?? this.runtime,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      stillPath: stillPath ?? this.stillPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
}
