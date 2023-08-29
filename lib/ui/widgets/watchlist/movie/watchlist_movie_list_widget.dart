import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/watchlist/movie/watchlist_movie_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistMovieWidget extends StatefulWidget {
  const WatchlistMovieWidget({super.key});

  @override
  State<WatchlistMovieWidget> createState() => _WatchlistMovieWidgetState();
}

class _WatchlistMovieWidgetState extends State<WatchlistMovieWidget> {
  @override
  void didChangeDependencies() {
    final locale = Localizations.localeOf(context);
    context.read<WatchlistMovieCubit>().setupWatchlistLocale(locale.languageCode);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<WatchlistMovieCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Watchlist'),
      body: Stack(
        children: [
          WatchlistPageWidget(cubit: cubit),
        ],
      ),
    );
  }
}

class WatchlistPageWidget extends StatelessWidget {
  const WatchlistPageWidget({
    super.key,
    required this.cubit,
  });

  final WatchlistMovieCubit cubit;

  @override
  Widget build(BuildContext context) {
    // final cubit = context.watch<WatchlistCubit>();
    return ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: cubit.state.movies.length,
        itemExtent: 165,
        itemBuilder: (BuildContext context, int index) {
          cubit.showedWatchlistMovieAtIndex(index);
          final movie = cubit.state.movies[index];
          final posterPath = movie.posterPath;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: InkWell(
              onTap: () {},
              child: Stack(
                children: [
                  Container(
                    decoration: context.read<ThemeBloc>().isDarkTheme ? customMovieListBoxDecorationForDarkTheme : customMovieListBoxDecorationForLightTheme,
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        posterPath != null
                            ? CachedNetworkImage(
                                imageUrl: ImageDownloader.imageUrl(posterPath),
                                placeholder: (context, url) => const LoadingIndicatorWidget(),
                                errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                              )
                            : Image.asset(AppImages.noImageAvailable),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10.0),
                                CustomCastListTextWidget(text: movie.title, maxLines: 2),
                                const SizedBox(height: 5.0),
                                CustomCastListTextWidget(text: movie.releaseDate, maxLines: 1),
                                const SizedBox(height: 15.0),
                                CustomCastListTextWidget(text: movie.overview, maxLines: 4),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
