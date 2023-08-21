// Project imports:
import 'package:comics_db_app/ui/widgets/trending/components/trending_list_data.dart';

class TrendingListCubitState {
  final List<TrendingListData> trendingList;
  final String localeTag;

  const TrendingListCubitState({
    required this.trendingList,
    required this.localeTag,
  });

  @override
  bool operator ==(Object other) => identical(this, other) || other is TrendingListCubitState && runtimeType == other.runtimeType && trendingList == other.trendingList && localeTag == other.localeTag;

  @override
  int get hashCode => trendingList.hashCode ^ localeTag.hashCode;

  TrendingListCubitState copyWith({
    List<TrendingListData>? trendingList,
    String? localeTag,
  }) {
    return TrendingListCubitState(
      trendingList: trendingList ?? this.trendingList,
      localeTag: localeTag ?? this.localeTag,
    );
  }
}
