import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/movie_list_bloc.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';

class MovieListCubitState {
  final List<MovieListData> movies;
  final String localTag;
  final String searchQuery;

  MovieListCubitState.name({required this.movies, required this.localTag, required this.searchQuery});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieListCubitState &&
          runtimeType == other.runtimeType &&
          movies == other.movies &&
          localTag == other.localTag &&
          searchQuery == other.searchQuery;

  @override
  int get hashCode => movies.hashCode ^ localTag.hashCode ^ searchQuery.hashCode;
}

class MovieListCubit extends Cubit<MovieListCubitState> {
  final MovieListBloc movieListBloc;
  late final StreamSubscription<MovieListState> movieListBlocSubscription;

  MovieListCubit({required MovieListCubitState initialState, required this.movieListBloc}) : super(initialState) {
    Future.microtask(
      () {
        _onState(movieListBloc.state);
        movieListBlocSubscription = movieListBloc.stream.listen(_onState);
        movieListBloc.add(AuthCheckStatusEvent());
      },
    );
  }

  void _onState(MovieListState state) {}
}
