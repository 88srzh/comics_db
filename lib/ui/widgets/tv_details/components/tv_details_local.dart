// Project imports:
import 'package:comics_db_app/domain/entity/tv_details.dart';

class TvDetailsLocal {
  final TVDetails details;
  final bool isFavorite;
  final bool isWatchlist;

  TvDetailsLocal({
    required this.details,
    required this.isFavorite,
    required this.isWatchlist,
  });
}
