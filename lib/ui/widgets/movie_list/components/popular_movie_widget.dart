import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularMovieWidget extends StatefulWidget {
  const PopularMovieWidget({Key? key}) : super(key: key);

  @override
  State<PopularMovieWidget> createState() => _PopularMovieWidgetState();
}

class _PopularMovieWidgetState extends State<PopularMovieWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<MovieListViewModel>().setupPopularMovieLocale(locale);
  }

// TODO: упростить? убрать
  @override
  Widget build(BuildContext context) {
    final popularMovieModel = context.watch<MovieListViewModel>();
    return PopularMovieListWidget(popularMovieModel: popularMovieModel);
  }
}

class PopularMovieListWidget extends StatelessWidget {
  const PopularMovieListWidget({
    Key? key,
    required this.popularMovieModel,
  }) : super(key: key);

  final MovieListViewModel popularMovieModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: popularMovieModel.movies.length,
      itemBuilder: (BuildContext context, int index) {
        popularMovieModel.showedPopularMovieAtIndex(index);
        final popularMovie = popularMovieModel.movies[index];
        final posterPath = popularMovie.posterPath;
        return InkWell(
          onTap: () => popularMovieModel.onMovieTap(context, index),
          child: _PopularMovieListItemWidget(
            index: index,
            posterPath: posterPath,
            movie: popularMovie,
            popularMovieModel: popularMovieModel,
          ),
        );
      },
    );
  }
}

class _PopularMovieListItemWidget extends StatelessWidget {
  const _PopularMovieListItemWidget({
    Key? key,
    required this.index,
    required this.posterPath,
    required this.movie,
    required this.popularMovieModel,
  }) : super(key: key);

  final int index;
  final String? posterPath;
  final MovieListData movie;
  final MovieListViewModel? popularMovieModel;

  @override
  Widget build(BuildContext context) {
    final popularMovieModel = context.watch<MovieListViewModel>();
    final popularMovie = popularMovieModel.movies[index];
    final posterPath = popularMovie.posterPath;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0, right: 10.0),
      child: Container(
        height: 200,
        width: 114,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          // color: AppColors.movieBorderLine,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: posterPath != null ? Image.network(ImageDownloader.imageUrl(posterPath)) : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
