import 'dart:async';

import 'package:comics_db_app/domain/blocs/tv/tv_season_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv_season_details.dart';
import 'package:comics_db_app/ui/widgets/tv_seasons/components/tv_season_data.dart';
import 'package:comics_db_app/ui/widgets/tv_seasons/tv_season_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TvSeasonCubit extends Cubit<TvSeasonCubitState> {
  final TvSeasonListBloc tvSeasonListBloc;
  late final StreamSubscription<TvSeasonState> tvSeasonsListBlocSubscription;
  late DateFormat _dateFormat;

  TvSeasonCubit({required this.tvSeasonListBloc}) : super(const TvSeasonCubitState(seasons: <TvSeasonDetailsData>[], localeTag: '')) {
    Future.microtask(
      () {
        _onState(tvSeasonListBloc.state);
        tvSeasonsListBlocSubscription = tvSeasonListBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(TvSeasonState state) {
    final tvSeasons = state.tvSeasons.map(_makeListData).toList();
    final newState = this.state.copyWith(seasons: tvSeasons);
    emit(newState);
  }

  TvSeasonDetailsData _makeListData(TvSeasonDetails tvSeasonDetails) {
    final firstAirDate = tvSeasonDetails.airDate;
    final String airDate = firstAirDate != null ? _dateFormat.format(firstAirDate) : '';
    return TvSeasonDetailsData(
      airDate: airDate,
      id: tvSeasonDetails.id,
      name: tvSeasonDetails.name,
      overview: tvSeasonDetails.overview,
      seasonNumber: tvSeasonDetails.seasonNumber,
      voteAverage: tvSeasonDetails.voteAverage,
      episodeNumber: tvSeasonDetails.episodeNumber,
      episodeType: tvSeasonDetails.episodeType,
      productionCode: tvSeasonDetails.productionCode,
      runtime: tvSeasonDetails.runtime,
      showId: tvSeasonDetails.showId,
      voteCount: tvSeasonDetails.voteCount,
      stillPath: tvSeasonDetails.stillPath,
    );
  }
  void setupTvSeasonLocale(String localeTag, int seasonNumber, int tvId) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    tvSeasonListBloc.add(const TvSeasonEventLoadReset());
    tvSeasonListBloc.add(TvSeasonEventLoadNextPage(locale: localeTag, seasonNumber: seasonNumber, tvId: tvId));
  }

  @override
  Future<void> close() {
    tvSeasonsListBlocSubscription.cancel();
    return super.close();
  }

  void showedAllEpisodesAtIndex(int index, int tvId) {
    if (index < state.seasons.length -1) return;
    tvSeasonListBloc.add(TvSeasonEventLoadNextPage(locale: state.localeTag, seasonNumber: state.seasons[index].seasonNumber, tvId: tvId));
  }
}
