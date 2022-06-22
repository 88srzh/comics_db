import 'package:comics_db_app/ui/widgets/movie_details/components/actor_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/poster_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_data.dart';

class MovieDetailsCubitState {
  final List<MovieDetailsPosterData> posterData;
  final List<MovieDetailsTrailerData> trailerData;
  final List<MovieDetailsMovieActorData> actorData;
  final String localeTag;

  MovieDetailsCubitState({
    required this.posterData,
    required this.trailerData,
    required this.actorData,
    required this.localeTag,
  });
}
