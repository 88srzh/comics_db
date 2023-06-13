// import 'dart:async';

// import 'package:comics_db_app/domain/blocs/movie/movie_details_recommendations.dart';
// import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
// import 'package:comics_db_app/domain/entity/movie.dart';
// import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
// import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit_state.dart';
// import 'package:intl/intl.dart';

// class MovieDetailsRecommendationsCubit extends Cubit<MovieListCubitState> {
//   final MovieDetailsRecommendationsBloc movieDetailsRecommendationsBloc;
//   late final StreamSubscription<MovieListState> movieDetailsRecommendationsBlocSubscription;
//   late DateFormat _dateFormat;
//   var movie = <Movie>[];

  // MovieDetailsRecommendationsCubit({required this.movieDetailsRecommendationsBloc})
  //     : super(MovieListCubitState(movies: const <MovieListData>[], localeTag: '', totalResults: 0)) {
  //   Future.microtask(
  //         () {
        // _onState(movieDetailsRecommendationsBloc.state);
        // movieDetailsRecommendationsBlocSubscription = movieDetailsRecommendationsBloc.stream.listen(_onState);
      // },
    // );
  // }

  // void _onState(MovieListState state) {
  //   final movies = state.movies.map(_makeListData).toList();
  //   final newState = this.state
  //   .
  // }

  // MovieListData _makeListData(Movie movie) {
  //   final releaseDate = movie.releaseDate;
  //   final releaseDateTitle = releaseDate != null ? _dateFormat.format(releaseDate) : '';
  //   return MovieListData(
  //
  //     title: movie.title,
  //     posterPath: movie.posterPath,
  //     backdropPath: movie.backdropPath,
  //     id: movie.id,
  //     originalTitle: movie.originalTitle,
  //     overview: movie.overview,
  //     releaseDate: releaseDateTitle,
  //   );
  // }
// }
