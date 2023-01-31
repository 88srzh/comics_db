// Flutter imports:
import 'package:comics_db_app/ui/components/custom_header_text_widget.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_main_appbar_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/now_playing_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/popular_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/top_rated_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/upcoming_movie_widget.dart';
import 'package:provider/provider.dart';

// Package imports:

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: перенести в каждую категорию
    // AlertDialog dialog = const AlertDialog(
    // TODO: after refactoring search doesn't work
    // content: _SearchWidget(),
    // );
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(themeNotifier.isDark ? "Dark mode" : "Light Mode"),
            actions: [
              IconButton(
                  onPressed: () {
                    themeNotifier.isDark ? themeNotifier.isDark = false : themeNotifier.isDark = true;
                  },
                  icon: Icon(themeNotifier.isDark ? Icons.nightlight_round : Icons.wb_sunny)),
            ],
          ),
          // appBar: const CustomMainAppBarWidget(),
          body: ColoredBox(
            // color: AppColors.kPrimaryColor,
            color: themeNotifier.isDark ? AppColors.kPrimaryColor : Colors.white70,
            child: ListView(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0),
                      child: SizedBox(
                        height: 180,
                        child: TopRatedMovieWidget(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomHeaderTextWidget(text: 'Popular'),
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.popularMovie),
                            child: const Text(
                              'See All',
                              style: TextStyle(color: AppColors.ratingText, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: PopularMovieWidget(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Coming Soon',
                            style: TextStyle(color: AppColors.genresText, fontSize: 21, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: UpcomingMovieWidget(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Now playing',
                        style: TextStyle(
                          color: AppColors.genresText,
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.nowPlayingMovie),
                        child: const Text(
                          'See All',
                          style: TextStyle(color: AppColors.ratingText, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: NowPlayingMovieWidget(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
