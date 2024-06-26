// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/generated/l10n.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_description_expandable_text_widget.dart';
import 'package:comics_db_app/ui/components/no_reviews_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_reviews_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class MovieDetailsReviewsWidget extends StatelessWidget {
  final String reviews;
  const MovieDetailsReviewsWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieDetailsCubit>();
    var index = cubit.state.id;
    var reviewsData = cubit.data.reviewsData;
    if (reviewsData.isEmpty) return const NoReviewsWidget();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reviews,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              InkWell(
                onTap: () => cubit.tapToSeeFullListOfReviews(context, index),
                child: Text(
                  S.of(context).seeAll,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
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
    final String reviewBy = S.of(context).reviewBy;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
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
        child: _MovieDetailsReviewsItemWidget(reviewBy: reviewBy),
      ),
    );
  }
}

class _MovieDetailsReviewsItemWidget extends StatelessWidget {
  final String reviewBy;
  const _MovieDetailsReviewsItemWidget({required this.reviewBy});

  @override
  Widget build(BuildContext context) {
    final reviewsData = context.read<MovieDetailsCubit>().data.reviewsData;
    final String author = reviewsData.first.author;
    final String content = reviewsData.first.content;
    final String createdAt = reviewsData.first.createdAt;
    final String writtenBy = S.of(context).writtenBy;
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        '$reviewBy $author',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
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
                                  style: TextStyle(color: reverseTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          '$writtenBy $author on $createdAt',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CustomDescriptionExpandableText(description: content, maxLines: 5, expandedText: S.of(context).readTheRest),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
