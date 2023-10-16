// Dart imports:
import 'dart:async';

// Package imports:
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/watchlist_tv_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/movie.dart';

class WatchlistTVCubit extends Cubit<TvListCubitState> {
  final WatchlistTVBloc watchlistBloc;
  late final StreamSubscription<TvListState> watchlistBlocSubscription;
  var movie = <Movie>[];
  late DateFormat _dateFormat;

  WatchlistTVCubit({required this.watchlistBloc}) : super(const TvListCubitState(tvs:  <TvListData>[], localeTag: '', totalResults: 0)) {
    Future.microtask(
          () {
        _onState(watchlistBloc.state);
        watchlistBlocSubscription = watchlistBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(TvListState state) {
    final tvs = state.tvs.map(_makeListData).toList();
    final newState = this.state.copyWith(tvs: tvs);
    emit(newState);
  }

  void setupWatchlistLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    watchlistBloc.add(const TvListEventLoadReset());
    watchlistBloc.add(TvListEventLoadNextPage(locale: localeTag));
  }

  @override
  Future<void> close() {
    watchlistBlocSubscription.cancel();
    return super.close();
  }

  void showedWatchlistTVAtIndex(int index) {
    if (index < state.tvs.length - 1) return;
    watchlistBloc.add(TvListEventLoadNextPage(locale: state.localeTag));
  }

  void showedWatchlistTvs() {
    watchlistBloc.add(const TvListEventLoadReset());
    watchlistBloc.add(TvListEventLoadNextPage(locale: state.localeTag));
  }

  TvListData _makeListData(TV tv) {
    final firstAirDate = tv.firstAirDate;
    final firstAirDateTitle = firstAirDate != null ? _dateFormat.format(firstAirDate) : '';
    return TvListData(
      name: tv.name,
      id: tv.id,
      posterPath: tv.posterPath,
      backdropPath: tv.backdropPath,
      overview: tv.overview,
      firstAirDate: firstAirDateTitle,
    );
  }

// TODO add onTap to movie and tv
}
