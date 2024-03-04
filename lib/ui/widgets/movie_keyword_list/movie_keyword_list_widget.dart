import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_keyword_list/movie_keyword_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieKeywordListWidget extends StatefulWidget {
  const MovieKeywordListWidget({super.key});

  @override
  State<MovieKeywordListWidget> createState() => _MovieKeywordListWidgetState();
}

class _MovieKeywordListWidgetState extends State<MovieKeywordListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<MovieKeywordsListCubit>().setupMovieKeywordLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieKeywordsListCubit>();
    return Scaffold(
      // TODO fix to keyword name
      appBar: const CustomDetailsAppBar(title: 'Keyword name'),
      body: Stack(
        children: [
          ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: cubit.state.movies.length,
            itemExtent: 165,
            itemBuilder: (BuildContext context, int index) {
              cubit.showedMovieKeywordMovieAtIndex(index);
              final movie = cubit.state.movies[index];
              final posterPath = movie.posterPath;
              return InkWell(
                onTap: () => onMovieTap(context, index),
                child: _MovieKeywordListRowWidget(posterPath: posterPath, movie: movie, cubit: cubit, index: index),
              );
            },
          ),
        ],
      ),
    );
  }

  void onMovieTap(BuildContext context, int index) {
    final cubit = context.read<MovieKeywordsListCubit>();
    final movieId = cubit.state.movies[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: movieId);
  }
}

class _MovieKeywordListRowWidget extends StatelessWidget {
  final int index;

  const _MovieKeywordListRowWidget({
    required this.posterPath,
    required this.movie,
    required this.cubit,
    required this.index,
  });

  final String? posterPath;
  final MovieListData movie;
  final MovieKeywordsListCubit cubit;

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
