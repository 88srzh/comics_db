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
    // year = year != null ? ' ($year)' : 'нету года';

    // TODO: refactoring
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 12),
          _TitleWidget(),
          SizedBox(height: 8),
          GenresWidget(),
          SizedBox(height: 4),
          RatingsRowWidget(),
        ],
      ),
    );
  }
}

class RatingsRowWidget extends StatelessWidget {
  const RatingsRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scoreData =
        context.select((MovieDetailsModel model) => model.data.scoresData);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          MdiIcons.starOutline,
          color: AppColors.ratingThumb,
          size: 14,
        ),
        const SizedBox(width: 2),
        Text(
          // TODO maybe change to String
          scoreData.voteAverage ?? '0.0',
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
          MdiIcons.accountOutline,
          color: AppColors.ratingThumb,
          size: 14,
        ),
        const SizedBox(width: 2),
        Text(
          scoreData.voteCount.toStringAsFixed(0),
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.ratingText,
          ),
        ),
        const SizedBox(width: 20),
        const Icon(
          MdiIcons.heartOutline,
          color: AppColors.ratingThumb,
          size: 14,
        ),
        const SizedBox(width: 2),
        Text(
          scoreData.popularity.toStringAsFixed(0),
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.ratingText,
          ),
        ),
      ],
    );
  }
}

class GenresWidget extends StatelessWidget {
  const GenresWidget({
    Key? key,
  }) : super(key: key);

  // final List<String> texts;

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailsModel>();
    var texts = <String>[];
    final genres = model.movieDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genre in genres) {
        genresNames.add(genre.name);
      }
      texts.add(genresNames.join(', '));
    }
    return Text(
      texts.join(' '),
      maxLines: 3,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 13,
        color: AppColors.genresText,
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleAndYear = context
        .select((MovieDetailsModel model) => model.data.titleAndYearData);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleAndYear.title,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
            color: AppColors.titleText,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          titleAndYear.year,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.titleText,
          ),
        ),
      ],
    );
  }
}
