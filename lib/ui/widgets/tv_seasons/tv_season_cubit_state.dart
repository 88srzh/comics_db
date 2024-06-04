import 'package:comics_db_app/ui/widgets/tv_seasons/components/tv_season_data.dart';

class TvSeasonCubitState {
  final List<TvSeasonDetailsData> seasons;
  final String localeTag;

  const TvSeasonCubitState({
    required this.seasons,
    required this.localeTag,
  });

  @override
  String toString() {
    return 'TvSeasonState{seasonData: $seasons, localeTag: $localeTag}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TvSeasonCubitState && runtimeType == other.runtimeType && seasons == other.seasons && localeTag == other.localeTag;

  @override
  int get hashCode => seasons.hashCode ^ localeTag.hashCode;

  TvSeasonCubitState copyWith({
    List<TvSeasonDetailsData>? seasons,
    String? localeTag,
  }) {
    return TvSeasonCubitState(
      seasons: seasons ?? this.seasons,
      localeTag: localeTag ?? this.localeTag,
    );
  }
}
