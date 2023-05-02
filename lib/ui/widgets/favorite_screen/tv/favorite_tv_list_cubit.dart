// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/tv/favorite_tv_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_cubit_state.dart';

class FavoriteTvListCubit extends Cubit<TvListCubitState> {
  final FavoriteTvListBloc favoriteTvListBloc;
  late final StreamSubscription<TvListState> favoriteTvListBlocSubscription;
  late DateFormat _dateFormat;
  Timer? searchDebounce;
  var tv = <TV>[];

  FavoriteTvListCubit({required this.favoriteTvListBloc})
      : super(const TvListCubitState(tvs: <TvListData>[], localeTag: '', totalResults: 0)) {
    Future.microtask(
      () {
        _onState(favoriteTvListBloc.state);
        favoriteTvListBlocSubscription = favoriteTvListBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(TvListState state) {
    final tvs = state.tvs.map(_makeListData).toList();
    final newState = this.state.copyWith(tvs: tvs);
    emit(newState);
  }

  void setupFavoriteTvLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    favoriteTvListBloc.add(const TvListEventLoadReset());
    favoriteTvListBloc.add(TvListEventLoadNextPage(locale: localeTag));
  }

  void updateFavoriteTvs(String localeTag) {
    favoriteTvListBloc.add(const TvListEventLoadReset());
    favoriteTvListBloc.add(TvListEventLoadNextPage(locale: localeTag));
  }

  @override
  Future<void> close() {
    favoriteTvListBlocSubscription.cancel();
    return super.close();
  }

  // TODO may be unite in one class
  TvListData _makeListData(TV tv) {
    final firstAirDate = tv.firstAirDate;
    final firstAirDateTitle = firstAirDate != null ? _dateFormat.format(firstAirDate) : '';
    return TvListData(
      name: tv.name,
      posterPath: tv.posterPath,
      backdropPath: tv.backdropPath,
      id: tv.id,
      overview: tv.overview,
      firstAirDate: firstAirDateTitle,
    );
  }

  void showedFavoriteTvAtIndex(int index) {
    if (index < state.tvs.length - 1) return;
    favoriteTvListBloc.add(TvListEventLoadNextPage(locale: state.localeTag));
  }

/*
  void searchFavoriteMovie(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      favoriteMovieListBloc.add(MovieListEventSearchMovie(query: text));
      favoriteMovieListBloc.add(MovieListEventLoadNextPage(locale: state.localeTag));
    });
  }
*/

  void onTvTap(BuildContext context, int index) {
    final id = tv[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.tvDetails, arguments: id);
  }
}
