// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/trending_all.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/trending/components/trending_list_cubit_state.dart';
import 'package:comics_db_app/ui/widgets/trending/components/trending_list_data.dart';
import 'package:comics_db_app/ui/widgets/trending/trending_list_bloc.dart';

class TrendingListCubit extends Cubit<TrendingListCubitState> {
  final TrendingListBloc trendingListBloc;
  late final StreamSubscription<TrendingListState> trendingListBlocSubscription;
  var trending = <TrendingAll>[];
  late DateFormat _dateFormat;

  TrendingListCubit({required this.trendingListBloc}) : super(const TrendingListCubitState(trendingList: <TrendingListData>[], localeTag: '')) {
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
    String releaseDate = makeReleaseDate(trending);
    String firstAirDate = makeFirstAirDate(trending);
    return TrendingListData(
      id: trending.id,
      posterPath: trending.posterPath ?? '',
      releaseData: releaseDate,
      title: trending.title,
      name: trending.name,
      firstAirDate: firstAirDate,
      mediaType: trending.mediaType,
      adult: trending.adult,
      overview: trending.overview,
    );
  }

  void setupTrendingLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    trendingListBloc.add(TrendingListEventLoadReset());
    trendingListBloc.add(TrendingListEventLoadAllThisWeek(locale: localeTag));
  }

  @override
  Future<void> close() {
    trendingListBlocSubscription.cancel();
    return super.close();
  }

  String makeReleaseDate(TrendingAll trending) {
    var texts = <String>[];
    final releaseDate = trending.releaseDate;
    if (releaseDate != null) {
      texts.add(_dateFormat.format(releaseDate));
    }
    return texts.join(' ');
  }

  String makeFirstAirDate(TrendingAll trending) {
    var texts = <String>[];
    final firstAirDate = trending.firstAirDate;
    if (firstAirDate != null) {
      texts.add(_dateFormat.format(firstAirDate));
    }
    return texts.join(' ');
  }

  void showedTrendingAtIndex(int index) {
    if (index < 10) return;
    trendingListBloc.add(TrendingListEventLoadAllThisWeek(locale: state.localeTag));
  }

  void showedTrendingAllThisWeek() {
    trendingListBloc.add(TrendingListEventLoadReset());
    trendingListBloc.add(TrendingListEventLoadAllThisWeek(locale: state.localeTag));
  }

  void showedTrendingMoviesThisWeek() {
    trendingListBloc.add(TrendingListEventLoadReset());
    trendingListBloc.add(TrendingListEventLoadMoviesThisWeek(locale: state.localeTag));
  }

  void showedTrendingTvThisWeek() {
    trendingListBloc.add(TrendingListEventLoadReset());
    trendingListBloc.add(TrendingListEventLoadTvThisWeek(locale: state.localeTag));
  }

  void onTrendingMovieTap(BuildContext context, int index) {
    final id = state.trendingList[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  void onTrendingTVTap(BuildContext context, int index) {
    final id = state.trendingList[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.tvDetails, arguments: id);
  }
}
