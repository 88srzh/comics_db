import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/movie_details_new_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'movie_details_new_state.dart';

class MovieDetailsNewCubit extends Cubit<MovieDetailsCubitNewState> {
  final MovieDetailsNewCubit movieDetailsNewCubit;
  late final StreamSubscription<MovieDetailsNewState> movieDetailsBlocSubscription;
  late DateFormat _dateFormat;
  var mov = <Movie>[];

  MovieDetailsNewCubit() : super(MovieDetailsCubitNewState(movies: const <MovieListData>[], localeTag: ''));
}
