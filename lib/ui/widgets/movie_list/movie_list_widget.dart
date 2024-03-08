// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_header_text_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/now_playing_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/popular_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/top_rated_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/upcoming_movie_widget.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: перенести в каждую категорию
    // AlertDialog dialog = const AlertDialog(
    // TODO: after refactoring search doesn't work
    // );
    return Scaffold(
      body: ListView(
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
                      child: Text(
                        'See All',
                        style: Theme.of(context).textTheme.displaySmall,
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
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
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
                  child: Text(
                    'See All',
                    style: Theme.of(context).textTheme.displaySmall,
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
    );
  }
}
