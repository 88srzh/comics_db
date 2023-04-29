part of 'tv_popular_list_bloc.dart';

@freezed
class TvListEvent  with _$TvListEvent {
  const factory TvListEvent.loadNextPage({required String locale}) = TvListEventLoadNextPage;

  const factory TvListEvent.reset() = TvListEventLoadReset;

  const factory TvListEvent.search({required String query}) = TvListEventSearchTv;
}
