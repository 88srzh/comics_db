import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_description_expandable_text_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_reviews_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MovieDetailsFullReviewsListWidget extends StatefulWidget {
  const MovieDetailsFullReviewsListWidget({super.key});

  @override
  State<MovieDetailsFullReviewsListWidget> createState() => _MovieDetailsFullReviewsListWidgetState();
}

class _MovieDetailsFullReviewsListWidgetState extends State<MovieDetailsFullReviewsListWidget> {
  late Future<String> lazyValue;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<MovieDetailsCubit>().setupMovieDetailsLocale(context, locale.languageCode);
    Future<String> loadingDelay() {
      Duration duration = const Duration(seconds: 1);

      return Future.delayed(duration, () => 'It took ${duration.inSeconds}');
    }

    lazyValue = loadingDelay();
  }

  @override
  Widget build(BuildContext context) {
    var reviewsData = context.watch<MovieDetailsCubit>().data.reviewsData;
    if (reviewsData.isEmpty) return const SizedBox.shrink();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Reviews'),
      body: _MovieDetailsFullReviewsColumnWidget(reviewsData: reviewsData),
    );
  }
}

class _MovieDetailsFullReviewsColumnWidget extends StatelessWidget {
  final List<MovieDetailsReviewsData> reviewsData;

  const _MovieDetailsFullReviewsColumnWidget({required this.reviewsData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: reviewsData.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
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
            child: _MovieDetailsFullReviewsItemWidget(index: index),
          ),
        );
      },
    );
  }
}

class _MovieDetailsFullReviewsItemWidget extends StatelessWidget {
  final int index;

  const _MovieDetailsFullReviewsItemWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieDetailsCubit>();
    final reviewsDataIndex = cubit.data.reviewsData[index];
    final String author = reviewsDataIndex.author;
    final String content = reviewsDataIndex.content;
    final String createdAt = reviewsDataIndex.createdAt;
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
                        Text('Written by ', style: Theme.of(context).textTheme.headlineMedium),
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
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: CustomDescriptionExpandableText(description: content, maxLines: 6, expandedText: ' read the rest.'),
                    // child: Text(
                    //   content,
                    //   style: Theme.of(context).textTheme.headlineMedium,
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
