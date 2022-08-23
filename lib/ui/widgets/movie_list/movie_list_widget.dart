import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/now_playing_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/popular_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/top_rated_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/upcoming_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: перенести в каждую категорию
    AlertDialog dialog = const AlertDialog(
      // TODO: after refactoring search doesn't work
      content: _SearchWidget(),
    );
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [Image.asset(AppImages.movieAppBarLogo)],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // TODO оптимизировать значки
                  _SearchIconWidget(dialog: dialog),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.filter_alt_outlined,
                        color: AppColors.ratingThumb,
                        size: 30,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.menu,
                      color: AppColors.ratingThumb,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
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
                      const Text(
                        'Popular',
                        style: TextStyle(
                          color: AppColors.genresText,
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.0),
                //   child: UpcomingMovieWidget(),
                // ),
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
                    // TODO fix nowPlayingMovie
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
  }
}

class _SearchIconWidget extends StatelessWidget {
  const _SearchIconWidget({
    Key? key,
    required this.dialog,
  }) : super(key: key);

  final AlertDialog dialog;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(context: context, builder: (context) => dialog);
      },
      child: const Icon(
        Icons.search,
        color: AppColors.searchIcon,
        size: 30,
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: поменять на модель поиска по всем фильмам
    final cubit = context.read<MovieListCubit>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onChanged: cubit.searchPopularMovie,
        decoration: InputDecoration(
          labelText: 'Search',
          labelStyle: const TextStyle(
            color: AppColors.kPrimaryColor,
          ),
          filled: true,
          fillColor: Colors.white.withAlpha(235),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kPrimaryColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}

// class _NowPlayingMovieListItemWidget extends StatelessWidget {
//   const _NowPlayingMovieListItemWidget({
//     Key? key,
//     required this.index,
//     required this.posterPath,
//     required this.movie,
//     required this.movieModel,
//   }) : super(key: key);
//
//   final int index;
//   final String? posterPath;
//   final MovieListData movie;
//   final NowPlayingMovieModel movieModel;
//
//   @override
//   Widget build(BuildContext context) {
//     final popularMovieModel = context.watch<MovieListViewModel>();
//     final popularMovie = popularMovieModel.movies[index];
//     final posterPath = popularMovie.posterPath;
//     return Padding(
//       padding: const EdgeInsets.only(top: 10.0, bottom: 20.0, right: 10.0),
//       child: Container(
//         height: 200,
//         width: 114,
//         clipBehavior: Clip.antiAlias,
//         decoration: const BoxDecoration(
//           color: AppColors.movieBorderLine,
// borderRadius: BorderRadius.all(Radius.circular(12)),
// ),
// child: FittedBox(
//   child: posterPath != null ? Image.network(ImageDownloader.imageUrl(posterPath)) : const SizedBox.shrink(),
//   fit: BoxFit.contain,
// ),
// ),
// );
// }
// }
