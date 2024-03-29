// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';

class TvDetailsTopPosterWidget extends StatelessWidget {
  const TvDetailsTopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvDetailsCubit>();
    final posterPath = cubit.state.posterPath;
    final backdropPath = cubit.state.backdropPath;
    return Stack(
      children: [
        Positioned(
          child: Opacity(
            opacity: 0.25,
            child: AspectRatio(
              aspectRatio: 390 / 220,
                child: backdropPath != null ? CachedNetworkImage(
                  imageUrl: ImageDownloader.imageUrl(backdropPath),
                  placeholder: (context, url) => const LoadingIndicatorWidget(),
                  errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                ) : const SizedBox.shrink(),
              ),
          ),
        ),
        Positioned(
          child:
          posterPath != null ?
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: SizedBox(
                height: 212.0,
                width: 174.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: ImageDownloader.imageUrl(posterPath),
                    placeholder: (context, url) => const LoadingIndicatorWidget(),
                    errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                  ),
                ),
              ),
            ),
          ) : Image.asset(AppImages.noImageAvailable),
        ),
      ],
    );
  }
}
