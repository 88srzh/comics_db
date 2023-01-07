// Project imports:
import 'package:comics_db_app/domain/entity/movie_details.dart';

class MovieDetailsLocal {
  final MovieDetails details;
  final bool isFavorite;

  MovieDetailsLocal({
    required this.details,
    required this.isFavorite,
  });
}
