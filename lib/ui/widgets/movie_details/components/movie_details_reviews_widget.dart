// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_reviews_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';

class MovieDetailsReviewsWidget extends StatelessWidget {
  const MovieDetailsReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context
        .read<ThemeBloc>()
        .isDarkTheme;
    var reviewsData = context
        .read<MovieDetailsCubit>()
        .data
        .reviewsData;
    if (reviewsData.isEmpty) return const SizedBox.shrink();
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Stack(
            children: [
              Container(
                decoration: isDarkTheme ? customMovieListBoxDecorationForDarkTheme : customMovieListBoxDecorationForLightTheme,
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: [
                    Text('Reviews', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,),
                    _MovieDetailsReviewsColumnWidget(reviewsData: reviewsData),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
        height: 160.0,
        child: Scrollbar(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reviewsData.length,
              itemExtent: 220,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    width: 220.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: context
                          .read<ThemeBloc>()
                          .isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
                      border: Border.all(
                          color: context
                              .read<ThemeBloc>()
                              .isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2)
                      ),
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
              }
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
    return Column(
      children: [
        Text(author, )
      ],
    );
  }
}

