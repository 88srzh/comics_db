// Project imports:
import 'package:comics_db_app/ui/widgets/trending/components/trending_list_data.dart';

class TrendingListCubitState {
  final List<TrendingListData> trendingList;
  // final List<MovieListData> movies;
  // final List<TvListData> tvs;
  final String localeTag;

  const TrendingListCubitState({
    required this.trendingList,
    required this.localeTag,
    // required this.movies,
    // required this.tvs,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrendingListCubitState &&
          runtimeType == other.runtimeType &&
          trendingList == other.trendingList &&
          localeTag == other.localeTag;
          // movies == other.movies &&
          // tvs == other.tvs;

  @override
  int get hashCode => trendingList.hashCode ^ localeTag.hashCode;

  TrendingListCubitState copyWith({
    List<TrendingListData>? trendingList,
    String? localeTag,
    // List<MovieListData>? movies,
    // List<TvListData>? tvs,
  }) {
    return TrendingListCubitState(
      trendingList: trendingList ?? this.trendingList,
      localeTag: localeTag ?? this.localeTag,
      // movies: movies ?? this.movies,
      // tvs: tvs ?? this.tvs,
    );
  }
}
