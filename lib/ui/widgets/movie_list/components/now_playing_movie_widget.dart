import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing_list/movie_now_playing_list_model.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing_list/now_playing_movie_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NowPlayingMovieWidget extends StatefulWidget {
  const NowPlayingMovieWidget({Key? key}) : super(key: key);

  @override
  State<NowPlayingMovieWidget> createState() => _NowPlayingMovieWidgetState();
}

class _NowPlayingMovieWidgetState extends State<NowPlayingMovieWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    // context.read<NowPlayingMovieListModel>().setupNowPlayingMovieLocale(locale);
    context.read<NowPlayingMovieListCubit>().setupNowPlayingMovieLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    // final nowPlayingMovieModel = context.watch<NowPlayingMovieListModel>();
    var cubit = context.watch<NowPlayingMovieListCubit>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // itemCount: nowPlayingMovieModel.movies.length,
      itemCount: cubit.state.movies.length,
      itemBuilder: (BuildContext context, int index) {
        // nowPlayingMovieModel.showedNowPlayingMovieAtIndex(index);
        cubit.showedNowPlayingMovieAtIndex(index);
        // final nowPlayingMovie = nowPlayingMovieModel.movies[index];
        final movie = cubit.state.movies[index];
        // final posterPath = nowPlayingMovie.posterPath;
        final posterPath = movie.posterPath;
        return InkWell(
          // onTap: () => nowPlayingMovieModel.onMovieTap(context, index),
          onTap: () => onMovieTap(context, index),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20.0, right: 10.0),
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 200,
              width: 114,
              decoration: const BoxDecoration(
                color: AppColors.movieBorderLine,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              // clipBehavior: Clip.antiAlias,
              child: FittedBox(
                fit: BoxFit.contain,
                child: posterPath != null ? Image.network(ImageDownloader.imageUrl(posterPath)) : const SizedBox.shrink(),
              ),
            ),
          ),
        );
      },
    );
  }

  void onMovieTap(BuildContext context, int index) {
    final cubit = context.read<NowPlayingMovieListCubit>();
    final movieId = cubit.state.movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: movieId);
  }
}
