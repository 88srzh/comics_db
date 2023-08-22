import 'dart:async';

import 'package:comics_db_app/domain/blocs/watrchlist/watchlist_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
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
        _onStateMovie(watchlistBloc.state);
        watchlistBlocSubscription = watchlistBloc.stream.listen(_onStateMovie);
        watchlistBlocSubscription = watchlistBloc.stream.listen((_onStateTV);
        },
    );
  }

  void _onStateMovie(WatchlistState state) {
    final movie = state.movies.map(_makeMoviesListData).toList();
    // may be need two lists for movie and tv separately
    final newState = this.state.copyWith(watchlistList: movie);
    emit(newState);
  }

  void _onStateTV(WatchlistState state) {
    final tv = state.tvs.map(_makeTVsListData).toList();
    final newState = this.state.copyWith(watchlistList: tv);
    emit(newState);
  }

  WatchlistData _makeMoviesListData(Movie movie) {
    String releaseDate = makeMovieReleaseDate(movie);
    return WatchlistData(
      id: movie.id,
      posterPath: movie.posterPath ?? '',
      releaseData: releaseDate,
      firstAirDate: '',
      overview: movie.overview,
    );
  }

  WatchlistData _makeTVsListData(TV tv) {
    String releaseDate = makeMovieReleaseDate(tv);
    String firstAirDate = makeFirstAirDate(tv);
    return WatchlistData(
      id: tv.id,
      posterPath: tv.posterPath ?? '',
      releaseData: releaseDate,
      firstAirDate: firstAirDate,
      overview: tv.overview,
    );
  }

  String makeFirstAirDate(TV tv) {
    var texts = <String>[];
    final firstAirDate = tv.firstAirDate;
    if (firstAirDate != null) {
      texts.add(_dateFormat.format(firstAirDate));
    }
    return texts.join(' ');
  }


  String makeMovieReleaseDate(Movie movie) {
    var texts = <String>[];
    final releaseDate = movie.releaseDate;
    if (releaseDate != null) {
      texts.add(_dateFormat.format(releaseDate));
    }
    return texts.join(' ');
  }


}
