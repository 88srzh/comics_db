import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_new_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieTopPosterWidget extends StatelessWidget {
  const MovieTopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieDetailsNewCubit>();
    final title = cubit.state.title;
    final tagline = cubit.state.tagline;
    var posterPath = cubit.state.posterPath;
    var voteCount = cubit.state.voteCount;
    var popularity = cubit.state.popularity;
    var releaseDate = cubit.state.releaseDate;
    // var posterData = cubit.posterData;
    final backdropPath = '';
    // final posterPath = posterData.posterPath;
    // TODO add favorite icon button
    // final movieData = context.select((MovieDetailsModel model) => model.data.posterData);
    // final posterPath = posterData.posterPath;
    // final backdropPath = posterData.backdropPath;
    // TODO поменять на модель
    // final summary = context.select((MovieDetailsModel model) => model.data.summary);
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
                          tagline,
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
                        releaseDate ?? '',
                        // '123',
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
                      // movieData.voteAverage ?? '0',
                      '123',
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
                      // '123',
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
                      popularity.toStringAsFixed(0),
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
            // clipBehavior: Clip.antiAlias,
            // TODO: не закругляются края
            height: 170.0,
            width: 140.0,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: posterPath != null
                  ? Image.network(ImageDownloader.imageUrl(posterPath))
                  : Image.asset(AppImages.noImageBig),
            ),
          ),
        ),
      ],
    );
  }
}
