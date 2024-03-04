// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_top_rated/top_rated_movie_list_cubit.dart';

class TopRatedMovieWidget extends StatefulWidget {
  const TopRatedMovieWidget({super.key});

  @override
  State<TopRatedMovieWidget> createState() => _TopRatedMovieWidgetState();
}

class _TopRatedMovieWidgetState extends State<TopRatedMovieWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<TopRatedMovieListCubit>().setupTopRatedMovieLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<TopRatedMovieListCubit>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cubit.state.movies.length,
      itemBuilder: (BuildContext context, int index) {
        cubit.showedTopRatedMovieAtIndex(index);
        final movie = cubit.state.movies[index];
        final backdropPath = movie.backdropPath;
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

  void onMovieTap(BuildContext context, int index) {
    // TODO may be change to watch to display images
    final cubit = context.read<TopRatedMovieListCubit>();
    final movieId = cubit.state.movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: movieId);
  }
}
