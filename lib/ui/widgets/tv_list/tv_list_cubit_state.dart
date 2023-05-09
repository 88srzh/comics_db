// Project imports:
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';

class TvListCubitState {
  final List<TvListData> tvs;
  final String localeTag;
  final int totalResults;

  const TvListCubitState({required this.tvs, required this.localeTag, required this.totalResults});

  @override
  String toString() {
    return 'TvListCubitState{tvs: $tvs, localeTag: $localeTag, totalResults: $totalResults}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvListCubitState &&
          runtimeType == other.runtimeType &&
          tvs == other.tvs &&
          localeTag == other.localeTag &&
          totalResults == other.totalResults;

  @override
  int get hashCode => tvs.hashCode ^ localeTag.hashCode ^ totalResults.hashCode;

  TvListCubitState copyWith({
    List<TvListData>? tvs,
    String? localeTag,
    int? totalResults,
  }) {
    return TvListCubitState(
      tvs: tvs ?? this.tvs,
      localeTag: localeTag ?? this.localeTag,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
