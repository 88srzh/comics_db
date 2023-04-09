import 'package:comics_db_app/domain/entity/movie.dart';

extension IterableExtension on List<Movie> {
  int getIndex(Movie movie) {
    int index = indexWhere((element) => element.id == movie.id);
    return index;
  }
}
