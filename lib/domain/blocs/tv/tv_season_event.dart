part of 'tv_season_list_bloc.dart';

@freezed
class TvSeasonEvent with _$TvSeasonEvent {

const factory TvSeasonEvent.loadNextPage({required String locale, required int seasonNumber}) = TvSeasonEventLoadNextPage;

const factory TvSeasonEvent.reset() = TvSeasonEventLoadReset;
}