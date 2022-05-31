import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing/now_playing_movie_model.dart';
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
    // final locale = Localizations.localeOf(context);
    context.read<NowPlayingMovieModel>().setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovieModel = context.watch<NowPlayingMovieModel>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: nowPlayingMovieModel.movies.length,
      itemBuilder: (BuildContext context, int index) {
        nowPlayingMovieModel.showedMovieAtIndex(index);
        final nowPlayingMovie = nowPlayingMovieModel.movies[index];
        final posterPath = nowPlayingMovie.posterPath;
        return InkWell(
          onTap: () => nowPlayingMovieModel.onMovieTap(context, index),
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
}
