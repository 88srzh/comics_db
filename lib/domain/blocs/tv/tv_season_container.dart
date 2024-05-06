import 'package:comics_db_app/domain/entity/tv_seasons.dart';
import 'package:equatable/equatable.dart';

class TvSeasonContainer extends Equatable {
  final List<TvSeasons> tvSeason;
  final int seasonNumber;

  bool get isComplete => seasonNumber >= seasonNumber + 1;

  const TvSeasonContainer.initial() : tvSeason = const <TvSeasons>[], seasonNumber = 0;

  const TvSeasonContainer({required this.tvSeason, required this.seasonNumber});

  @override
  List<Object> get props => [tvSeason, seasonNumber];

  TvSeasonContainer copyWith({
    List<TvSeasons>? tvSeason,
    int? seasonNumber,
  }) {
    return TvSeasonContainer(
      tvSeason: tvSeason ?? this.tvSeason,
      seasonNumber: seasonNumber ?? this.seasonNumber,
    );
  }
}
