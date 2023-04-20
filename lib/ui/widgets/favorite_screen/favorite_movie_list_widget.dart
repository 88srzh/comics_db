// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/favorite_screen/favorite_movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';

class FavoriteMovieListWidget extends StatefulWidget {
  const FavoriteMovieListWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteMovieListWidget> createState() => _FavoriteMovieListWidgetState();
}

class _FavoriteMovieListWidgetState extends State<FavoriteMovieListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    // var cubit = context.watch<FavoriteMovieListCubit>();
    // var totalResults = cubit.state.totalResults;
    context.read<FavoriteMovieListCubit>().setupFavoriteMovieLocale(locale.languageCode);
    // context.read<FavoriteMovieListCubit>().updateFavoriteMovies(locale.languageCode);
    // context.read<FavoriteMovieListCubit>().updateFavoriteMovies(totalResults, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<FavoriteMovieListCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Favorite Movies'),
      body: Stack(
        children: [
          ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: cubit.state.movies.length,
            itemExtent: 165,
            itemBuilder: (BuildContext context, int index) {
              cubit.showedFavoriteMovieAtIndex(index);
              final movie = cubit.state.movies[index];
              final posterPath = movie.posterPath;
              return InkWell(
                onTap: () => onMovieTap(context, index),
                child: _FavoriteMovieListRowWidget(posterPath: posterPath, movie: movie, cubit: cubit, index: index),
              );
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          //   child: CustomSearchBar(onChanged: cubit.searchFavoriteMovie),
          // ),
        ],
      ),
    );
  }

  void onMovieTap(BuildContext context, int index) {
    final cubit = context.read<FavoriteMovieListCubit>();
    final movieId = cubit.state.movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: movieId);
  }
}

class _FavoriteMovieListRowWidget extends StatelessWidget {
  final int index;

  const _FavoriteMovieListRowWidget({
    Key? key,
    required this.posterPath,
    required this.movie,
    required this.cubit,
    required this.index,
  }) : super(key: key);

  final String? posterPath;
  final MovieListData movie;
  final FavoriteMovieListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Stack(
        children: [
          Container(
            decoration: context.read<ThemeBloc>().isDarkTheme
                ? customMovieListBoxDecorationForDarkTheme
                : customMovieListBoxDecorationForLightTheme,
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                posterPath != null
                    ? Image.network(
                        ImageDownloader.imageUrl(posterPath!),
                        width: 95,
                      )
                    : Image.asset(AppImages.noImageAvailable),
                const SizedBox(width: 15.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      CustomCastListTextWidget(
                        text: movie.originalTitle,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5.0),
                      CustomCastListTextWidget(
                        text: movie.releaseDate,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 15.0),
                      CustomCastListTextWidget(
                        text: movie.overview ?? '',
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
