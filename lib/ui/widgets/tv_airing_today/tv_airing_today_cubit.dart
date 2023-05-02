// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/tv/tv_airing_today_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_cubit_state.dart';

// Package imports:


class TvAiringTodayListCubit extends Cubit<TvListCubitState> {
  final TvAiringTodayListBloc tvAiringTodayListBloc;
  late final StreamSubscription<TvListState> tvAiringTodayListBlocSubscription;
  Timer? searchDebounce;
  var tv = <TV>[];

  TvAiringTodayListCubit({required this.tvAiringTodayListBloc})
      : super(const TvListCubitState(tvs: <TvListData>[], localeTag: '', totalResults: 0)) {
    Future.microtask(() {
      _onState(tvAiringTodayListBloc.state);
      tvAiringTodayListBlocSubscription = tvAiringTodayListBloc.stream.listen(_onState);
    });
  }

  void _onState(TvListState state) {
    final tvs = state.tvs.map(_makeListData).toList();
    final newState = this.state.copyWith(tvs: tvs);
    emit(newState);
  }

  void setupAiringTodayTvLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    tvAiringTodayListBloc.add(const TvListEventLoadReset());
    tvAiringTodayListBloc.add(TvListEventLoadNextPage(locale: localeTag));
  }

  @override
  Future<void> close() {
    tvAiringTodayListBlocSubscription.cancel();
    return super.close();
  }

  TvListData _makeListData(TV tv) {
    return TvListData(
        id: tv.id, name: tv.name, overview: tv.overview, posterPath: tv.posterPath, backdropPath: tv.backdropPath);
  }

  void showedAiringTodayTvAtIndex(int index) {
    if (index < state.tvs.length - 1) return;
    tvAiringTodayListBloc.add(TvListEventLoadNextPage(locale: state.localeTag));
  }

  void searchAiringTodayTv(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(
      const Duration(milliseconds: 300),
      () async {
        tvAiringTodayListBloc.add(TvListEventSearchTv(query: text));
        tvAiringTodayListBloc.add(TvListEventLoadNextPage(locale: state.localeTag));
      },
    );
  }

  void onTvTap(BuildContext context, int index) {
    final id = state.tvs[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.tvDetails, arguments: id);
  }
}
