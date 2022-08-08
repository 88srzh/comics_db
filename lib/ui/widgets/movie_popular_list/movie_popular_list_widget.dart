import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit.dart';
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
    context.read<MovieListCubit>().setupPopularMovieLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieListCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Popular Movies',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: Stack(
          children: [
            ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 70.0),
              itemCount: cubit.state.movies.length,
              itemExtent: 165,
              itemBuilder: (BuildContext context, int index) {
                cubit.showedPopularMovieAtIndex(index);
                final movie = cubit.state.movies[index];
                final posterPath = movie.posterPath;
                return InkWell(
                  // onTap: () => cubit.onMovieTap(context, index),
                  onTap: () => onMovieTap(context, index),
                  child: _MoviePopularListRowWidget(posterPath: posterPath, movie: movie, cubit: cubit, index: index),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: TextField(
                style: const TextStyle(
                  color: AppColors.genresText,
                ),
                onChanged: cubit.searchPopularMovie,
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: const TextStyle(
                    color: AppColors.genresText,
                  ),
                  filled: true,
                  fillColor: AppColors.kPrimaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onMovieTap(BuildContext context, int index) {
    final cubit = context.read<MovieListCubit>();
    final movieId = cubit.state.movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: movieId);
  }
}

class _MoviePopularListRowWidget extends StatelessWidget {
  final int index;

  const _MoviePopularListRowWidget({
    Key? key,
    required this.posterPath,
    required this.movie,
    required this.cubit,
    required this.index,
  }) : super(key: key);

  final String? posterPath;
  final MovieListData movie;
  final MovieListCubit cubit;

  @override
  Widget build(BuildContext context) {
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
              ],
            ),
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
                        movie.overview ?? '',
                        maxLines: 3,
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
          // InkWell(
          //   borderRadius: BorderRadius.circular(20.0),
          //   onTap: () => _onMovieTap(context, movie.id),
          // onTap: () => _onMovieTap(context, index),
          // ),
        ],
      ),
    );
  }

}
