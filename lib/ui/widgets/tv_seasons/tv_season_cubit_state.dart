import 'package:comics_db_app/ui/widgets/tv_seasons/components/tv_season_data.dart';

class TvSeasonCubitState {
  final List<TvSeasonDetailsData> seasonData;
  final String localeTag;

  const TvSeasonCubitState({
    required this.seasonData,
    required this.localeTag,
  });

  @override
  String toString() {
    return 'TvSeasonState{seasonData: $seasonData, localeTag: $localeTag}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TvSeasonCubitState && runtimeType == other.runtimeType && seasonData == other.seasonData && localeTag == other.localeTag;

  @override
  int get hashCode => seasonData.hashCode ^ localeTag.hashCode;

  TvSeasonCubitState copyWith({
    List<TvSeasonDetailsData>? seasonData,
    String? localeTag,
  }) {
    return TvSeasonCubitState(
      seasonData: seasonData ?? this.seasonData,
      localeTag: localeTag ?? this.localeTag,
    );
  }
}
