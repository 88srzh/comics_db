import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularMovieWidget extends StatefulWidget {
  const PopularMovieWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularMovieWidget> createState() => _PopularMovieWidgetState();
}

class _PopularMovieWidgetState extends State<PopularMovieWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<MovieListCubit>().setupPopularMovieLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final popularMovieCubit = context.watch<MovieListCubit>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: popularMovieCubit.state.movies.length,
      itemBuilder: (BuildContext context, int index) {
        // popularMovieCubit.state.showedPopularMovieAtIndex(index);
        popularMovieCubit.showedPopularMovieAtIndex(index);
        final popularMovie = popularMovieCubit.state.movies[index];
        final posterPath = popularMovie.posterPath;
        return InkWell(
          // TODO: не уверен, что индекс вместо movieId
            onTap: () => _onMovieTap(context, index),
            child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20.0, right: 10.0),
        child: Container(
        height: 200,
        width: 114,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
        color: AppColors.movieBorderLine,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: FittedBox(
        fit: BoxFit.contain,
        child: posterPath != null
        ? Image.network(ImageDownloader.imageUrl(posterPath))
            : const SizedBox.shrink()),
        )
        ,
        )
        ,
        );
      },
    );
  }

  void _onMovieTap(BuildContext context, int movieId) {
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: movieId);
  }
}
