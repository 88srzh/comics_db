import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieTopPosterWidget extends StatelessWidget {
  const MovieTopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieDetailsCubit>();
    final title = cubit.state.title;
    final tagline = cubit.state.tagline;
    final voteAverage = cubit.state.voteAverage;
    final voteAverageString = voteAverage!.toStringAsFixed(1);
    final voteCount = cubit.state.voteCount;
    final popularity = cubit.state.popularity;
    int? popularityInt = popularity?.toInt();
    final releaseDate = cubit.state.releaseDate;
    final summary = cubit.state.summary;
    final genres = cubit.state.genres;

    // TODO must fix: cache image error
    final posterPath = cubit.state.posterPath;
    final backdropPath = cubit.state.backdropPath;

    // TODO add favorite icon button
    return Stack(
      children: [
        Positioned(
          child: Opacity(
            opacity: 0.25,
            child: AspectRatio(
              aspectRatio: 390 / 220,
              child: CachedNetworkImage(
                imageUrl: ImageDownloader.imageUrl(backdropPath!),
                placeholder: (context, url) => const LoadingIndicatorWidget(),
                errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageBig),
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 20,
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
                        summary,
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
                    genres,
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
                      voteAverageString,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.ratingText,
                      ),
                    ),
                    const Text(
                      ' from IMDB',
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
        Positioned(
          top: 55,
          left: 240,
          child: SizedBox(
            //     TODO: не закругляются края
            height: 180.0,
            width: 140.0,
            child: CachedNetworkImage(
              imageUrl: ImageDownloader.imageUrl(posterPath!),
              placeholder: (context, url) => const LoadingIndicatorWidget(),
              errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageBig),
            ),
          ),
        ),
      ],
    );
  }
}
