// Flutter imports:
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/navigation/main_navigation.dart';

class MovieDetailsAllVideosWidget extends StatefulWidget {
  const MovieDetailsAllVideosWidget({Key? key}) : super(key: key);

  @override
  State<MovieDetailsAllVideosWidget> createState() => _MovieDetailsAllVideosWidgetState();
}

class _MovieDetailsAllVideosWidgetState extends State<MovieDetailsAllVideosWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<MovieDetailsCubit>().setupMovieDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieDetailsCubit>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cubit.state.allVideos.length,
      itemBuilder: (BuildContext context, int index) {
        // cubit.showedTopRatedMovieAtIndex(index);
        // final video = cubit.state.allVideos[index];
        // final backdropPath = video.backdropPath;
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
              onTap: () => onMovieTap(context, index),
              // child: backdropPath != null
              // TODO: may be wrap in fitted box
                  // ? Image.network(ImageDownloader.imageUrl(backdropPath))
                  // : const SizedBox.shrink(),
              child: const Text('123'),
            ),
          ),
        );
      },
    );
  }

  void onMovieTap(BuildContext context, int index) {
    final cubit = context.read<MovieDetailsCubit>();
    final movieId = cubit.state.allVideos[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: movieId);
  }
}
