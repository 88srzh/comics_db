import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieTopPosterWidget extends StatelessWidget {
  const MovieTopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO add favorite icon button
    final movieData =
        context.select((MovieDetailsModel model) => model.data.posterData);
    final posterPath = movieData.posterPath;
    final backdropPath = movieData.backdropPath;
    // TODO поменять на модель
    final summary =
        context.select((MovieDetailsModel model) => model.data.summary);
    final releaseDateText =
        context.select((MovieDetailsModel model) => model.data.releaseDate);
    final genres =
        context.select((MovieDetailsModel model) => model.data.genres);

    return Stack(
      children: [
        Positioned(
          top: 65,
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
                        // TODO: центрировать текст по высоте
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            movieData.title,
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
                const SizedBox(height: 10),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        releaseDateText,
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
                      movieData.voteAverage ?? '0',
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
                      movieData.voteCount.toStringAsFixed(0),
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
                      movieData.popularity.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.ratingText,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
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
        // TODO: исправить стрелку, чтобы не съезжала
        Positioned(
          left: 10,
          top: 10,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_sharp, color: Colors.white),
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
