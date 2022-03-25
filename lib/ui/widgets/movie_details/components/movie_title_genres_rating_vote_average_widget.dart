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
    final model = context.read<MovieDetailsModel>();
    var rating = model.movieDetails?.voteAverage.toString();
    // var year = model.movieDetails?.releaseDate?.year.toString();
    var voteCount = model.movieDetails?.voteCount ?? 0;
    voteCount = voteCount * 10;
    var popularity = model.movieDetails?.popularity ?? 0;
    popularity *= 10;
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

    // TODO: refactoring
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 12),
          const _TitleWidget(),
          const SizedBox(height: 8),
          _GenresWidget(texts: texts),
          const SizedBox(height: 4),
          _RatingsRowWidget(
            rating: rating,
            voteCount: voteCount,
            popularity: popularity,
          ),
        ],
      ),
    );
  }
}

class _RatingsRowWidget extends StatelessWidget {
  const _RatingsRowWidget({
    Key? key,
    required this.rating,
    required this.voteCount,
    required this.popularity,
  }) : super(key: key);

  final String? rating;
  final int voteCount;
  final double popularity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TODO: refactoring need
        const Icon(
          MdiIcons.starOutline,
          color: AppColors.ratingThumb,
          size: 14,
        ),
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
          MdiIcons.accountOutline,
          color: AppColors.ratingThumb,
          size: 14,
        ),
        const SizedBox(width: 2),
        Text(
          voteCount.toStringAsFixed(0),
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
          popularity.toStringAsFixed(0),
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.ratingText,
          ),
        ),
      ],
    );
  }
}

class _GenresWidget extends StatelessWidget {
  const _GenresWidget({
    Key? key,
    required this.texts,
  }) : super(key: key);

  final List<String> texts;

  @override
  Widget build(BuildContext context) {
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
    // TODO: fix
    final title =
        context.select((MovieDetailsModel model) => model.data.title);
    return Text(
      title,
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        color: AppColors.titleText,
      ),
    );
  }
}
