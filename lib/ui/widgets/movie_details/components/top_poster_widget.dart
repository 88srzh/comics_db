import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieTopPosterWidget extends StatelessWidget {
  const MovieTopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final posterData = context.select((MovieDetailsNewCubit cubit) => cubit.posterData);
    // final title = posterData.title;
    // final backdropPath = posterData.backdropPath;a
    final cubit = context.watch<MovieDetailsCubit>();
    final title = cubit.state.title;
    final tagline = cubit.state.tagline;
    var posterData = cubit.posterData;
    final voteAverage = cubit.state.voteAverage;
    final voteCount = cubit.state.voteCount;
    final popularity = cubit.state.popularity;
    int? popularityInt = popularity?.toInt();
    final releaseDate = cubit.state.releaseDate;

    // TODO must fix: cache image error
    final backdropPath = posterData.backdropPath;
    final posterPath = posterData.posterPath;

    // final posterPath = cubit.state.posterPath;
    // final posterPath = cubit.posterData.posterPath;
    // final posterPath = posterData.posterPath;
    // TODO add favorite icon button
    // final cubit = context.watch<MovieDetailsCubit>();
    // var posterData = cubit.posterData;
    // final movieData = context.select((MovieDetailsModel model) => model.data.posterData);
    // final posterData = context.select((MovieDetailsCubit cubit) => cubit.posterData);
    // final posterPath = posterData.posterPath;
    // final backdropPath = posterData.backdropPath;
    // TODO поменять на модель
    // final summary = context.select((MovieDetailsModel model) => model.data.summary);
    // final releaseDateText = context.select((MovieDetailsModel model) => model.data.releaseDate);
    // final genres = context.select((MovieDetailsModel model) => model.data.genres);

    return Stack(
      children: [
        Positioned(
          child: Opacity(
            opacity: 0.25,
            child: AspectRatio(
              aspectRatio: 390 / 220,
              child: backdropPath != null
                  ? Image.network(
                      ImageDownloader.imageUrl(backdropPath),
                    )
                  : Image.asset(AppImages.noImageBig),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 10,
          child: SizedBox(
            height: 300,
            width: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 25,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title,
                            // '123',
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 21,
                              color: AppColors.titleText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 210,
                        child: Text(
                          tagline ?? 'No tagline',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 13,
                            color: AppColors.titleText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        releaseDate,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.genresText,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        // summary,
                        '123',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.genresText,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    // genres,
                    '123',
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.genresText,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      MdiIcons.starOutline,
                      color: AppColors.ratingStar,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      // TODO: fix, may be change double to string
                      voteAverage.toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.ratingText,
                      ),
                    ),
                    const Text(
                      ' от IMDB',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.ratingText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      MdiIcons.accountOutline,
                      color: AppColors.ratingThumb,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      voteCount.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.ratingText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      MdiIcons.heartOutline,
                      color: AppColors.ratingThumb,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      popularityInt.toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.ratingText,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // TODO: fix arrow
        Positioned(
          top: 55,
          left: 240,
          child: SizedBox(
            // clipBehavior: Clip.antiAlias,
            // TODO: не закругляются края
            height: 170.0,
            width: 140.0,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: posterPath != null ? Image.network(ImageDownloader.imageUrl(posterPath)) : Image.asset(AppImages.noImageBig),
            ),
          ),
        ),
      ],
    );
  }
}
