import 'package:comics_db_app/domain/entity/tv_season_details.dart';
import 'package:equatable/equatable.dart';

class TvSeasonContainer extends Equatable {
  final List<TvSeasonDetails> tvSeason;

  const TvSeasonContainer.initial() : tvSeason = const <TvSeasonDetails>[];

  const TvSeasonContainer({required this.tvSeason});

  @override
  List<Object> get props => [tvSeason];

  TvSeasonContainer copyWith({
    List<TvSeasonDetails>? tvSeason,
  }) {
    return TvSeasonContainer(
      tvSeason: tvSeason ?? this.tvSeason,
    );
  }
}
