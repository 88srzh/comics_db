part of 'trending_list_bloc.dart';

@freezed
class TrendingListEvent with _$TrendingListEvent {
  factory TrendingListEvent.loadNextPage({required String locale}) = TrendingListEventLoadNextPage;
  factory TrendingListEvent.loadNextThisWeek({required String locale}) = TrendingListEventLoadNextPageThisWweek;
  factory TrendingListEvent.loadReset() = TrendingListEventLoadReset;
}
