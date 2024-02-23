// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/core/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing_list/now_playing_movie_list_cubit.dart';

class NowPlayingMovieWidget extends StatefulWidget {
  const NowPlayingMovieWidget({super.key});

  @override
  State<NowPlayingMovieWidget> createState() => _NowPlayingMovieWidgetState();
}

class _NowPlayingMovieWidgetState extends State<NowPlayingMovieWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<NowPlayingMovieListCubit>().setupNowPlayingMovieLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<NowPlayingMovieListCubit>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cubit.state.movies.length,
      itemBuilder: (BuildContext context, int index) {
        cubit.showedNowPlayingMovieAtIndex(index);
        final movie = cubit.state.movies[index];
        final posterPath = movie.posterPath;
        return InkWell(
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
                child:
                    posterPath != null ? Image.network(ImageDownloader.imageUrl(posterPath)) : const SizedBox.shrink(),
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
