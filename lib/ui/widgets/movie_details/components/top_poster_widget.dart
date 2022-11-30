import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_poster_top_left_text.dart';
import 'package:comics_db_app/ui/components/custom_poster_top_left_text_rating.dart';
import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_title.dart';
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
                errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 20,
          child: MovieDetailsTitle(title: title),
        ),
        Positioned(
          top: 50,
          left: 20,
          child: SizedBox(
            height: 300,
            width: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
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
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    CustomPosterTopLeftAlignText(text: releaseDate),
                  ],
                ),
                Row(
                  children: [
                    CustomPosterTopLeftAlignText(text: summary),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        genres,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.genresText,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      MdiIcons.starOutline,
                      color: AppColors.ratingStar,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    CustomPosterTopLeftAlignTextRating(text: '$voteAverageString from IMDB'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      MdiIcons.accountOutline,
                      color: AppColors.ratingThumb,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    CustomPosterTopLeftAlignTextRating(text: voteCount.toStringAsFixed(0)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      MdiIcons.heartOutline,
                      color: AppColors.ratingThumb,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    CustomPosterTopLeftAlignTextRating(text: popularityInt.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 55,
          right: 15,
          child: SizedBox(
            //     TODO: не закругляются края
            height: 180.0,
            width: 140.0,
            child: CachedNetworkImage(
              imageUrl: ImageDownloader.imageUrl(posterPath!),
              placeholder: (context, url) => const LoadingIndicatorWidget(),
              errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
            ),
          ),
        ),
      ],
    );
  }
}
