part of 'trending_list_bloc.dart';

@freezed
class TrendingListEvent with _$TrendingListEvent {
  factory TrendingListEvent.loadAllThisWeek({required String locale}) = TrendingListEventLoadAllThisWeek;
  factory TrendingListEvent.loadMoviesThisWeek({required String locale}) = TrendingListEventLoadMoviesThisWeek;
  factory TrendingListEvent.loadTvThisWeek({required String locale}) = TrendingListEventLoadTvThisWeek;
  factory TrendingListEvent.loadReset() = TrendingListEventLoadReset;
}
