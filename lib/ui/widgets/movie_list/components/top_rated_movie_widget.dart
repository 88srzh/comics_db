import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/movie_top_rated/top_rated_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopRatedMovieWidget extends StatefulWidget {
  const TopRatedMovieWidget({Key? key}) : super(key: key);

  @override
  State<TopRatedMovieWidget> createState() => _TopRatedMovieWidgetState();
}

class _TopRatedMovieWidgetState extends State<TopRatedMovieWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<TopRatedMovieModel>().setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    final topRatedMovieModel = context.watch<TopRatedMovieModel>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: topRatedMovieModel.movies.length,
      itemBuilder: (BuildContext context, int index) {
        // topRatedMovieModel.searchTopRatedMovie();
        final topMovie = topRatedMovieModel.movies[index];
        final backdropPath = topMovie.backdropPath;
        return Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Container(
            width: 320,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: InkWell(
              onTap: () => topRatedMovieModel.onMovieTap(context, index),
              child: backdropPath != null
              // TODO: may be wrap in fitted box
                  ? Image.network(ImageDownloader.imageUrl(backdropPath))
                  : const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
