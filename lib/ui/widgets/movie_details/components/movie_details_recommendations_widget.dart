// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/recommendations_data.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class MovieDetailsRecommendations extends StatelessWidget {
  const MovieDetailsRecommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recommendationsData = context.watch<MovieDetailsCubit>().data.recommendationsData;
    if (recommendationsData.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO move to separate custom widget.
          Text(
            'Recommendations',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _MovieDetailsRecommendationsWidget(recommendationsData: recommendationsData),
        ],
      ),
    );
  }
}

class _MovieDetailsRecommendationsWidget extends StatelessWidget {
  final List<MovieDetailsRecommendationsData> recommendationsData;
  const _MovieDetailsRecommendationsWidget({
    Key? key,
    required this.recommendationsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        height: 160,
        child: Scrollbar(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendationsData.length,
            itemExtent: 220,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  width: 220,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
                    border: Border.all(
                      color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: MovieDetailsItemRecommendationsWidget(index: index),
                ),
              );
            },
          ),
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
    final recommendationsId = recommendationsData.id;
    final backdropPath = recommendationsData.backdropPath;
    final title = recommendationsData.title;
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: recommendationsId),
      child: ClipRRect(
        child: Column(
          children: [
            backdropPath != null
                ? CachedNetworkImage(
                    imageUrl: ImageDownloader.imageUrl(backdropPath),
                    placeholder: (context, url) => const LoadingIndicatorWidget(),
                    errorWidget: (context, url, dynamic error) => Image.asset(AppImages.imageNotAvailableHorizontal),
                  )
                : Image.asset(AppImages.imageNotAvailableHorizontal),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCastListTextWidget(text: title, maxLines: 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
