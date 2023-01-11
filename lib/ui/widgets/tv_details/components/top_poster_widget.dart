// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';

class TvTopPosterWidget extends StatelessWidget {
  const TvTopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvDetailsPosterData = context
        .select((TvDetailsModel model) => model.tvData.tvDetailsPosterData);
    final posterPath = tvDetailsPosterData.posterPath;
    final backdropPath = tvDetailsPosterData.backdropPath;
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
                      fit: BoxFit.cover,
                    )
                  : Image.asset(AppImages.noImageAvailable),
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: SizedBox(
                height: 212.0,
                width: 174.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: posterPath != null
                      ? Image.network(ImageDownloader.imageUrl(posterPath))
                      : Image.asset(AppImages.noImageAvailable),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
