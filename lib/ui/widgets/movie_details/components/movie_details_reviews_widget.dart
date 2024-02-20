// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_description_expandable_text_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_reviews_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MovieDetailsReviewsWidget extends StatelessWidget {
  const MovieDetailsReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var reviewsData = context.read<MovieDetailsCubit>().data.reviewsData;
    if (reviewsData.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _MovieDetailsReviewsColumnWidget(reviewsData: reviewsData),
        ],
      ),
    );
  }
}

class _MovieDetailsReviewsColumnWidget extends StatelessWidget {
  final List<MovieDetailsReviewsData> reviewsData;

  const _MovieDetailsReviewsColumnWidget({required this.reviewsData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        height: 240.0,
        child: Scrollbar(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reviewsData.length,
            itemExtent: 375,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
                    border: Border.all(color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: MovieDetailsReviewsItemWidget(index: index),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MovieDetailsReviewsItemWidget extends StatelessWidget {
  final int index;

  const MovieDetailsReviewsItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieDetailsCubit>();
    final reviewsData = cubit.data.reviewsData[index];
    final reviewsId = reviewsData.id;
    final String author = reviewsData.author;
    final String content = reviewsData.content;
    final String createdAt = reviewsData.createdAt;
    Color textColor = context.read<ThemeBloc>().isDarkTheme ? Colors.white : DarkThemeColors.kPrimaryColor;
    Color reverseTextColor = context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white;
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                child: Image.asset(AppImages.noImageAvailable),
                // child: CachedNetworkImage(
                //   imageUrl: ImageDownloader.imageUrl(avatarPath),
                //   placeholder: (context, url) => const LoadingIndicatorWidget(),
                //   errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
              ),
            ),
            // const SizedBox(width: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'A review by $author',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: textColor,
                        border: Border.all(
                          color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            Icon(MdiIcons.star, size: 14, color: reverseTextColor),
                            Text(
                              '6.0',
                              style: TextStyle(
                                color: reverseTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Row(
                      children: [
                        Text(
                          'Written by ',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          author,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(' on $createdAt', style: Theme.of(context).textTheme.headlineMedium),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: 320.0,
                    child: Text(
                      content,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
