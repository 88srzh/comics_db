import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class TitleGenresRatingVoteAverageWidget extends StatelessWidget {
  const TitleGenresRatingVoteAverageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    var tvDetailsScoresData = context
        .select((TvDetailsModel model) => model.tvData.tvDetailsScoresData);
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
          tvDetailsScoresData.voteAverage ?? '0.0',
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
          tvDetailsScoresData.voteCount.toStringAsFixed(0),
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
          tvDetailsScoresData.popularity.toStringAsFixed(0),
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

  @override
  Widget build(BuildContext context) {
    final genres = context.select((TvDetailsModel model) => model.tvData.genres);
    return Text(
      genres,
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
    final tvNameData =
        context.select((TvDetailsModel model) => model.tvData.tvNameData);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          tvNameData.name,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
            color: AppColors.titleText,
          ),
        ),
        const SizedBox(width: 2),
      ],
    );
  }
}
