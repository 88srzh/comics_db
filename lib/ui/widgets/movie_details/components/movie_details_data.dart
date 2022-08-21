import 'package:comics_db_app/ui/widgets/movie_details/components/actor_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_data.dart';

class MovieDetailsData {
  String title = '';
  String tagline = '';
  bool isLoading = true;
  String overview = '';
  MovieDetailsPosterData posterData = const MovieDetailsPosterData(title: '', voteCount: 0, popularity: 0);
  String summary = '';
  String releaseDate = '';
  String genres = '';
  double? voteAverage = 0;
  String? trailerKey = '';
  // String? posterPath = '';
  // String? backdropPath = '';
  // TODO may be decpmpose trailerData
  // MovieDetailsTrailerData trailerData = MovieDetailsTrailerData();
  List<List<MovieDetailsMoviePeopleData>> peopleData = const <List<MovieDetailsMoviePeopleData>>[];
  List<MovieDetailsMovieActorData> actorsData = const <MovieDetailsMovieActorData>[];
}
