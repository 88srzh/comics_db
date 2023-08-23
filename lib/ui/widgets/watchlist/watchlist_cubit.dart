import 'dart:async';

import 'package:comics_db_app/domain/blocs/watchlist/watchlist_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/trending_all.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/widgets/watchlist/components/watchlist_data.dart';
import 'package:comics_db_app/ui/widgets/watchlist/watchlist_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WatchlistCubit extends Cubit<WatchlistCubitState> {
  final WatchlistBloc watchlistBloc;
  late final StreamSubscription<WatchlistState> watchlistBlocSubscription;
  var movie = <Movie>[];
  var tv = <TV>[];
  late DateFormat _dateFormat;

  WatchlistCubit({required this.watchlistBloc}) : super(const WatchlistCubitState(watchlistList: <WatchlistData>[], localeTag: '')) {
    Future.microtask(
      () {
        _onState(watchlistBloc.state);
        watchlistBlocSubscription = watchlistBloc.stream.listen(_onState);
        // watchlistBlocSubscription = watchlistBloc.stream.asBroadcastStream();
        // watchlistBlocSubscription = watchlistBloc.stream.listen(_onStateTV);
      },
    );
  }

  void _onState(WatchlistState state) {
    final movie = state.watchlist.map(_makeListData).toList();
    // may be need two lists for movie and tv separately
    final newState = this.state.copyWith(watchlistList: movie);
    emit(newState);
  }

  // void _onStateTV(WatchlistState state) {
  //   final tv = state.tvs.map(_makeTVsListData).toList();
  //   final newState = this.state.copyWith(watchlistList: tv);
  //   emit(newState);
  // }

  void setupWatchlistLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMd(localeTag);
    watchlistBloc.add(WatchlistEventLoadReset());
    watchlistBloc.add(WatchlistEventLoadMovies(locale: localeTag));
  }

  @override
  Future<void> close() {
    watchlistBlocSubscription.cancel();
    return super.close();
  }

  void showedWatchlistMovieAtIndex(int index) {
    watchlistBloc.add(WatchlistEventLoadMovies(locale: state.localeTag));
  }

  void showedWatchlistMovies() {
    watchlistBloc.add(WatchlistEventLoadReset());
    watchlistBloc.add(WatchlistEventLoadMovies(locale: state.localeTag));
  }

  void showedWatchlistTVs() {
    watchlistBloc.add(WatchlistEventLoadReset());
    watchlistBloc.add(WatchlistEventLoadTV(locale: state.localeTag));
  }

  WatchlistData _makeListData(TrendingAll trending) {
    String releaseDate = makeMovieReleaseDate(trending);
    return WatchlistData(
      id: trending.id,
      posterPath: trending.posterPath ?? '',
      releaseData: releaseDate,
      firstAirDate: '',
      overview: trending.overview,
      title: trending.title,
    );
  }

  // WatchlistData _makeTVsListData(TV tv) {
  //   String firstAirDate = makeFirstAirDate(tv);
  //   return WatchlistData(
  //     id: tv.id,
  //     posterPath: tv.posterPath ?? '',
  //     releaseData: '',
  //     firstAirDate: firstAirDate,
  //     overview: tv.overview,
  //   );
  // }

  String makeFirstAirDate(TV tv) {
    var texts = <String>[];
    final firstAirDate = tv.firstAirDate;
    if (firstAirDate != null) {
      texts.add(_dateFormat.format(firstAirDate));
    }
    return texts.join(' ');
  }

  String makeMovieReleaseDate(TrendingAll trending) {
    var texts = <String>[];
    final releaseDate = trending.releaseDate;
    if (releaseDate != null) {
      texts.add(_dateFormat.format(releaseDate));
    }
    return texts.join(' ');
  }

  String makeTVReleaseDate(TV tv) {
    var texts = <String>[];
    final firstAirDate = tv.firstAirDate;
    if (firstAirDate != null) {
      texts.add(_dateFormat.format(firstAirDate));
    }
    return texts.join(' ');
  }

  // TODO add onTap to movie and tv
}
