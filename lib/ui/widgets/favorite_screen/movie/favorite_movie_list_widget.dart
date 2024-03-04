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
import 'package:comics_db_app/ui/widgets/favorite_screen/movie/favorite_movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';

class FavoriteMovieListWidget extends StatefulWidget {
  const FavoriteMovieListWidget({super.key});

  @override
  State<FavoriteMovieListWidget> createState() => _FavoriteMovieListWidgetState();
}

class _FavoriteMovieListWidgetState extends State<FavoriteMovieListWidget> {
  @override
  void didChangeDependencies() {
    final locale = Localizations.localeOf(context);
    context.read<FavoriteMovieListCubit>().setupFavoriteMovieLocale(locale.languageCode);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<FavoriteMovieListCubit>();
    final locale = Localizations.localeOf(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35.0))),
        child: const Icon(IconData(0xf00e9, fontFamily: 'MaterialIcons')),
        onPressed: () => setState(() {
          cubit.updateFavoriteMovies(locale.languageCode);
        }),
      ),
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
    required this.posterPath,
    required this.movie,
    required this.cubit,
    required this.index,
  });

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
            decoration: context.read<ThemeBloc>().isDarkTheme ? customMovieListBoxDecorationForDarkTheme : customMovieListBoxDecorationForLightTheme,
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
                      const SizedBox(height: 10.0),
                      CustomCastListTextWidget(text: movie.originalTitle, maxLines: 1),
                      const SizedBox(height: 5.0),
                      CustomCastListTextWidget(text: movie.releaseDate, maxLines: 1),
                      const SizedBox(height: 15.0),
                      CustomCastListTextWidget(text: movie.overview, maxLines: 4),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
