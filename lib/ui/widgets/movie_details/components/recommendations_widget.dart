// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';

class MovieDetailsRecommendations extends StatelessWidget {
  const MovieDetailsRecommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recommendationsData = context.watch<MovieDetailsCubit>().data.recommendationsData;
    if (recommendationsData.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO move to separate custom widget
          Text(
            'Recommendations',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const _MovieDetailsRecommendationsWidget(),
        ],
      ),
    );
  }
}

class _MovieDetailsRecommendationsWidget extends StatelessWidget {
  const _MovieDetailsRecommendationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recommendationsData = context.watch<MovieDetailsCubit>().data.recommendationsData;
    if (recommendationsData.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                width: 220,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: MovieDetailsItemRecommendationsWidget(index: index),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MovieDetailsItemRecommendationsWidget extends StatelessWidget {
  final int index;

  const MovieDetailsItemRecommendationsWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieDetailsCubit>();
    final recommendationsData = cubit.data.recommendationsData[index];
    // final recommendationsId = recommendationsData.id;
    final backdropPath = recommendationsData.backdropPath;
    final title = recommendationsData.title;
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          backdropPath != null
              ? CachedNetworkImage(
                  imageUrl: ImageDownloader.imageUrl(backdropPath),
                  placeholder: (context, url) => const LoadingIndicatorWidget(),
                  errorWidget: (context, url, dynamic error) => Image.asset(AppImages.imageNotAvailableHorizontal),
                )
              : Image.asset(AppImages.imageNotAvailableHorizontal),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCastListTextWidget(text: title, maxLines: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
