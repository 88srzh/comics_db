import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_details_appbar.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing_list/now_playing_movie_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieNowPlayingListWidget extends StatefulWidget {
  const MovieNowPlayingListWidget({Key? key}) : super(key: key);

  @override
  State<MovieNowPlayingListWidget> createState() => _MovieNowPlayingListWidgetState();
}

class _MovieNowPlayingListWidgetState extends State<MovieNowPlayingListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<NowPlayingMovieListCubit>().setupNowPlayingMovieLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<NowPlayingMovieListCubit>();
    return Scaffold(
      appBar: const CustomDetailsAppBar(title: 'Now Playing Movies'),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: Stack(
          children: [
            cubit.state.movies.isNotEmpty
                ? ListView.builder(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const EdgeInsets.only(top: 70.0),
                    itemCount: cubit.state.movies.length,
                    itemExtent: 165,
                    itemBuilder: (BuildContext context, int index) {
                      cubit.showedNowPlayingMovieAtIndex(index);
                      final movie = cubit.state.movies[index];
                      final posterPath = movie.posterPath;
                      return InkWell(
                        onTap: () => cubit.onMovieTap(context, index),
                        child: _MoviePopularListRowWidget(posterPath: posterPath, movie: movie, cubit: cubit, index: index),
                      );
                    },
                  )
                : const CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: TextField(
                style: const TextStyle(
                  color: AppColors.genresText,
                ),
                onChanged: cubit.searchNowPlayingMovie,
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
  final NowPlayingMovieListCubit cubit;

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
          //   onTap: () => model.onMovieTap(context, index),
          // ),
        ],
      ),
    );
  }
}
