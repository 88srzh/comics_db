import 'dart:async';

import 'package:comics_db_app/domain/entity/trending_all.dart';
import 'package:comics_db_app/ui/widgets/trending/components/trending_list_cubit_state.dart';
import 'package:comics_db_app/ui/widgets/trending/components/trending_list_data.dart';
import 'package:comics_db_app/ui/widgets/trending/trending_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingListCubit extends Cubit<TrendingListCubitState> {
  final TrendingListBloc trendingListBloc;
  late final StreamSubscription<TrendingListState> trendingListBlocSubscription;
  var trending = <TrendingAll>[];

  TrendingListCubit({required this.trendingListBloc})
      : super(const TrendingListCubitState(trendingList: <TrendingListData>[], localeTag: '')) {
    Future.microtask(
      () {
        _onState(trendingListBloc.state);
        trendingListBlocSubscription = trendingListBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(TrendingListState state) {
    final trending = state.trending.map(_makeListData).toList();
    final newState = this.state.copyWith(trendingList: trending);
    emit(newState);
  }

  TrendingListData _makeListData(TrendingAll trending) {
    return TrendingListData(
      id: trending.id,
      posterPath: trending.posterPath ?? '',
      releaseData: trending.releaseDate.toString(),
    );
  }

  void setupTrendingLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    trendingListBloc.add(TrendingListEventLoadReset());
    trendingListBloc.add(TrendingListEventLoadNextPage(locale: localeTag));
  }

  @override
  Future<void> close() {
    trendingListBlocSubscription.cancel();
    return super.close();
  }

  void showedTrendingAtIndex(int index) {
    if (index < state.trendingList.length - 1) return;
    trendingListBloc.add(TrendingListEventLoadNextPage(locale: state.localeTag));
  }

  // TODO need to think how realise to movie, tv and people.
  // void onTrendingTap(BuildContext context, int index) {
  //   final id = state.trendingList[index].id;
  // }
}
