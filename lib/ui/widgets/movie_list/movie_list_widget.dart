// Flutter imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/components/custom_header_text_widget.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_main_appbar_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/now_playing_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/popular_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/top_rated_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/upcoming_movie_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: const CustomMainAppBarWidget(),
      body: ColoredBox(
        // TODO doesn't work
        color: context.read<ThemeBloc>().isLightTheme ? Colors.white70 : AppColors.kPrimaryColor,
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
                          style: TextStyle(
                            color: AppColors.ratingText,
                            fontSize: 15,
                          ),
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
                      CustomHeaderTextWidget(text: 'Coming soon'),
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
                  const CustomHeaderTextWidget(text: 'Now playing'),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.nowPlayingMovie),
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: AppColors.ratingText,
                        fontSize: 15,
                      ),
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
  }
}
