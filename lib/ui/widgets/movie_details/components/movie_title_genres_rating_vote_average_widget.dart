import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class TitleGenresRatingVoteAverageWidget extends StatelessWidget {
  const TitleGenresRatingVoteAverageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieDetailsModel>();
    // TODO: возможно косяк voteCount = rating
    var rating = model.movieDetails?.voteAverage.toString();
    // var year = model.movieDetails?.releaseDate?.year.toString();
    // var voteCount = model.movieDetails?.voteCount ?? 0;
    var voteCount = model.movieDetails?.voteCount ?? 0;
    voteCount = voteCount * 10;
    var popularity = model.movieDetails?.popularity ?? 0;
    popularity *= 10;

    // genres
    // if (model == null) return const SizedBox.shrink();
    var texts = <String>[];
    final genres = model.movieDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genre in genres) {
        genresNames.add(genre.name);
      }
      texts.add(genresNames.join(', '));
    }
    // year = year != null ? ' ($year)' : 'нету года';
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 12),
          Text(
            model.movieDetails?.title ?? 'Загрузка названия...',
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: AppColors.titleText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            texts.join(' '),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.genresText,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: AppColors.ratingStar, size: 14),
              const SizedBox(width: 2),
              Text(
                rating ?? '0.0',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.ratingText,
                ),
              ),
              const Text(
                ' / 10 от themoviedb',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.ratingText,
                ),
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.thumb_up_alt_outlined,
                color: AppColors.ratingThumb,
                size: 14,
              ),
              const SizedBox(width: 2),
              Text(
                // voteCount.toStringAsFixed(0) + '%',
                voteCount.toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.ratingText,
                ),
              ),
              // TODO: fix icon
              const SizedBox(width: 20),
              const Icon(
              MdiIcons.heartOutline,
                color: AppColors.ratingThumb,
                size: 14,
              ),
              const SizedBox(width: 2),
              Text(
                popularity.toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.ratingText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
