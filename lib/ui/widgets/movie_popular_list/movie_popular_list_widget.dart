// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/custom_search_bar_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit.dart';

class MoviePopularListWidget extends StatefulWidget {
  const MoviePopularListWidget({Key? key}) : super(key: key);

  @override
  State<MoviePopularListWidget> createState() => _MoviePopularListWidgetState();
}

class _MoviePopularListWidgetState extends State<MoviePopularListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<MoviePopularListCubit>().setupPopularMovieLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MoviePopularListCubit>();

    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Scaffold(
          appBar: const CustomDetailsAppBar(title: 'Popular Movies'),
          body: ColoredBox(
            color: notifierTheme.isDark ? AppColors.kPrimaryColor : Colors.white70,
            child: Stack(
              children: [
                ListView.builder(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.only(top: 70.0),
                  itemCount: cubit.state.movies.length,
                  itemExtent: 165,
                  itemBuilder: (BuildContext context, int index) {
                    cubit.showedPopularMovieAtIndex(index);
                    final movie = cubit.state.movies[index];
                    final posterPath = movie.posterPath;
                    return InkWell(
                      onTap: () => cubit.onMovieTap(context, index),
                      child:
                          _MoviePopularListRowWidget(posterPath: posterPath, movie: movie, cubit: cubit, index: index),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: CustomSearchBar(onChanged: cubit.searchPopularMovie),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MoviePopularListRowWidget extends StatelessWidget {
  final int index;

  const _MoviePopularListRowWidget({
    Key? key,
    required this.posterPath,
    required this.movie,
    required this.cubit,
    required this.index,
  }) : super(key: key);

  final String? posterPath;
  final MovieListData movie;
  final MoviePopularListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Stack(
            children: [
              Container(
                decoration: notifierTheme.isDark
                    ? customMovieListBoxDecorationForDarkTheme
                    : customMovieListBoxDecorationForLightTheme,
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    posterPath != null
                        ? Image.network(
                            ImageDownloader.imageUrl(posterPath!),
                            width: 95,
                          )
                        : Image.asset(AppImages.noImageAvailable),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20.0),
                          CustomCastListTextWidget(
                              text: movie.originalTitle,
                              maxLines: 1,
                              fontSize: null,
                              color: notifierTheme.isDark ? Colors.white : AppColors.kPrimaryColor,
                              fontWeight: FontWeight.bold),
                          const SizedBox(height: 5.0),
                          CustomCastListTextWidget(
                              text: movie.releaseDate,
                              maxLines: 1,
                              fontSize: 13,
                              color: notifierTheme.isDark ? AppColors.genresText : AppColors.kPrimaryColor,
                              fontWeight: null),
                          const SizedBox(height: 15.0),
                          CustomCastListTextWidget(
                              text: movie.overview ?? '',
                              maxLines: 3,
                              fontSize: 12,
                              color: notifierTheme.isDark ? AppColors.genresText : AppColors.kPrimaryColor,
                              fontWeight: null),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5.0),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
