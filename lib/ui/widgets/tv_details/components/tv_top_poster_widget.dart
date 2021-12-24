import 'dart:math';

import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvTopPosterWidget extends StatelessWidget {
  const TvTopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvModel = Provider.of<TvDetailsModel>(context, listen: true);
    final posterPath = tvModel.tvDetails?.posterPath;
    final backdropPath = tvModel.tvDetails?.backdropPath;

    var allRuntimes = <String>[];
    final runtimes = tvModel.tvDetails?.episodeRunTime;

    // TODO:  упростить, я получаю одно число только
    if (runtimes != null && runtimes.isNotEmpty) {
      var singleRuntime = <String>[];
      for (var runtime in runtimes) {
        singleRuntime.add(runtime.toString());
      }
      allRuntimes.add(singleRuntime.join(', '));
    }


    var voteCount = tvModel.tvDetails?.voteCount.toString() ?? '0';
    var voteAverage = tvModel.tvDetails?.voteAverage ?? 0;
    voteAverage = voteAverage * 10;

    var texts = <String>[];
    final genres = tvModel.tvDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genre in genres) {
        genresNames.add(genre.name);
      }
      texts.add(genresNames.join(', '));
    }
    return Stack(
      children: [
        Positioned(
            child: AspectRatio(
              aspectRatio: 390/220,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2),
                    BlendMode.dstATop,
                ),
                child: backdropPath != null ? Image.network(
                    ApiClient.imageUrl(backdropPath),
                )
                : const SizedBox.shrink(),
              ),
            )
        ),
        Positioned(
          top: 55,
          left: 240,
          child: Container(
            clipBehavior: Clip.antiAlias,
            // TODO: не закругляются края
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            height: 170.0,
            width: 140.0,
            child: posterPath != null ? Image.network(ApiClient.imageUrl(posterPath))
            : const SizedBox.shrink(),
          ),
        ),
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
                    height: 50,
                    child: Column(
                      children: [
                        // TODO: центрировать текст по высоте
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(tvModel.tvDetails?.name ?? 'Загрузка названия',
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 21,
                            color: AppColors.titleText,
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // TODO: пофиксить
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          allRuntimes.join(' '),
                          // runtimes.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.genresText,
                          ),
                        ),
                      ),
                      const Text(
                        ' минут(ы)',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.genresText,
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      //   child: Image.asset(AppImages.ellipseDot),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      texts.join(' '),
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.genresText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.ratingStar, size: 14),
                      const SizedBox(width: 4),
                      Text(voteCount,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.ratingText,
                        ),
                      ),
                      const Text(' пользователям понравилось',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.ratingText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.thumb_up_alt_outlined, color: AppColors.ratingThumb, size: 14),
                      const SizedBox(width: 4),
                      Text(voteAverage.toStringAsFixed(0) + '% от пользователей',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.ratingText,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            )
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
      ],
    );
  }
}
