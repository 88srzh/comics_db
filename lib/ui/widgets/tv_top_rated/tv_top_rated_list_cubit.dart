// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_top_rated_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_cubit_state.dart';

class TvTopRatedListCubit extends Cubit<TvListCubitState> {
  final TvTopRatedListBloc tvTopRatedListBloc;
  late final StreamSubscription<TvListState> tvListBlocSubscription;
  late DateFormat dateFormat;
  Timer? searchDebounce;
  var tv = <TV>[];

  TvTopRatedListCubit({required this.tvTopRatedListBloc})
      : super(const TvListCubitState(tvs: <TvListData>[], localeTag: '')) {
    Future.microtask(() {
      _onState(tvTopRatedListBloc.state);
      tvListBlocSubscription = tvTopRatedListBloc.stream.listen(_onState);
    });
  }

  void _onState(TvListState state) {
    final tvs = state.tvs.map(_makeListData).toList();
    final newState = this.state.copyWith(tvs: tvs);
    emit(newState);
  }

  void setupTopRatedTvLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    dateFormat = DateFormat.yMMMd(localeTag);
    tvTopRatedListBloc.add(const TvListEventLoadReset());
    tvTopRatedListBloc.add(TvListEventLoadNextPage(locale: localeTag));
  }

  @override
  Future<void> close() {
    tvListBlocSubscription.cancel();
    return super.close();
  }

  TvListData _makeListData(TV tv) {
    return TvListData(
        id: tv.id,
        name: tv.name,
        overview: tv.overview,
        posterPath: tv.posterPath,
        backdropPath: tv.backdropPath);
  }

  void showedTopRatedTvAtIndex(int index) {
    if (index < state.tvs.length - 1) return;
    tvTopRatedListBloc.add(TvListEventLoadNextPage(locale: state.localeTag));
  }

  void searchPopularTv(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      tvTopRatedListBloc.add(TvListEventSearchTv(query: text));
      tvTopRatedListBloc.add(TvListEventLoadNextPage(locale: state.localeTag));
    });
  }

  void onTvTap(BuildContext context, int index) {
    final id = state.tvs[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.tvDetails, arguments: id);
  }
}
