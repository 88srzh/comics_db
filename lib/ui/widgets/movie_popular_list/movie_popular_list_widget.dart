import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviePopularListWidget extends StatefulWidget {
  const MoviePopularListWidget({Key? key}) : super(key: key);

  @override
  State<MoviePopularListWidget> createState() => _MoviePopularListWidgetState();
}

class _MoviePopularListWidgetState extends State<MoviePopularListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<MovieListViewModel>().setupPopularMovieLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieListViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: Stack(
          children: [
            ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 70.0),
              itemCount: model.movies.length,
              itemExtent: 165,
              itemBuilder: (BuildContext context, int index) {
                model.showedPopularMovieAtIndex(index);
                final movie = model.movies[index];
                final posterPath = movie.posterPath;
                return _MoviePopularListRowWidget(posterPath: posterPath, movie: movie, model: model, index: index);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: model.searchPopularMovie,
                decoration: InputDecoration(
                  labelText: 'Поиск',
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
            ),
          ],
        ),
      ),
    );
  }
}

class _MoviePopularListRowWidget extends StatelessWidget {
  final int index;

  const _MoviePopularListRowWidget({
    Key? key,
    required this.posterPath,
    required this.movie,
    required this.model,
    required this.index,
  }) : super(key: key);

  final String? posterPath;
  final MovieListData movie;
  final MovieListViewModel model;

  @override
  Widget build(BuildContext context) {
    // final genres = context.select((MovieDetailsModel model) => model.data.genres);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                posterPath != null
                    ? Image.network(
                        // TODO: fix posterPath not null
                        ImageDownloader.imageUrl(posterPath!),
                        width: 95,
                      )
                    : Image.asset(AppImages.noImage),
                const SizedBox(width: 15.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Text(
                        movie.originalTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        movie.releaseDate,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.genresText,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        movie.overview,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.genresText,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5.0),
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () => model.onMovieTap(context, index),
          ),
        ],
      ),
    );
  }
}
