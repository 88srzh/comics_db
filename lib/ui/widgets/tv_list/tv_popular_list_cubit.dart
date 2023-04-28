// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_cubit_state.dart';

class TvPopularListCubit extends Cubit<TvListCubitState> {
  final TvPopularListBloc tvPopularListBloc;
  late final StreamSubscription<TvListState> tvListBlocSubscription;
  late DateFormat _dateFormat;
  Timer? searchDebounce;
  var tv = <TV>[];

  TvPopularListCubit({required this.tvPopularListBloc})
      : super(const TvListCubitState(tvs: <TvListData>[], localeTag: '')) {
    Future.microtask(() {
      _onState(tvPopularListBloc.state);
      tvListBlocSubscription = tvPopularListBloc.stream.listen(_onState);
    });
  }

  void _onState(TvListState state) {
    final tvs = state.tvs.map(_makeListData).toList();
    final newState = this.state.copyWith(tvs: tvs);
    emit(newState);
  }

  void setupPopularTvLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    tvPopularListBloc.add(TvListEventLoadReset());
    tvPopularListBloc.add(TvListEventLoadNextPage(localeTag));
  }

  @override
  Future<void> close() {
    tvListBlocSubscription.cancel();
    return super.close();
  }

  TvListData _makeListData(TV tv) {
    final firstAirDate = tv.firstAirDate;
    final firstAirDateTitle = firstAirDate != null ? _dateFormat.format(firstAirDate) : '';
    return TvListData(
      id: tv.id,
      name: tv.name,
      overview: tv.overview,
      posterPath: tv.posterPath,
      backdropPath: tv.backdropPath,
      firstAirDate: firstAirDateTitle,
    );
  }

  void showedPopularTvAtIndex(int index) {
    if (index < state.tvs.length - 1) return;
    tvPopularListBloc.add(TvListEventLoadNextPage(state.localeTag));
  }

  void searchPopularTv(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      tvPopularListBloc.add(TvListEventSearchTv(text));
      tvPopularListBloc.add(TvListEventLoadNextPage(state.localeTag));
    });
  }

  void onTvTap(BuildContext context, int index) {
    final id = state.tvs[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.tvDetails, arguments: id);
  }
}
