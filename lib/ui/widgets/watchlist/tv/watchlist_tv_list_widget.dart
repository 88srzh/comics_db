import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/watchlist/tv/watchlist_tv_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistTVWidget extends StatefulWidget {
  const WatchlistTVWidget({super.key});

  @override
  State<WatchlistTVWidget> createState() => _WatchlistTVWidgetState();
}

class _WatchlistTVWidgetState extends State<WatchlistTVWidget> {
  @override
  void didChangeDependencies() {
    final locale = Localizations.localeOf(context);
    context.read<WatchlistTVCubit>().setupWatchlistLocale(locale.languageCode);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<WatchlistTVCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        onTapRu: () {},
        onTapEn: () {},
      ),
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

  final WatchlistTVCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemExtent: 165,
      itemCount: cubit.state.tvs.length,
      itemBuilder: (BuildContext context, int index) {
        cubit.showedWatchlistTVAtIndex(index);
        final tv = cubit.state.tvs[index];
        final posterPath = tv.posterPath;
        return InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: context.read<ThemeBloc>().isDarkTheme ? customMovieListBoxDecorationForDarkTheme : customMovieListBoxDecorationForLightTheme,
                  child: Row(
                    children: [
                      posterPath != null
                          ? CachedNetworkImage(
                              imageUrl: ImageDownloader.imageUrl(posterPath),
                              placeholder: (context, url) => const LoadingIndicatorWidget(),
                              errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                            )
                          : Image.asset(AppImages.noImageAvailable),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10.0),
                            CustomCastListTextWidget(text: tv.name, maxLines: 2),
                            const SizedBox(height: 5.0),
                            CustomCastListTextWidget(text: tv.firstAirDate, maxLines: 1),
                            const SizedBox(height: 15.0),
                            CustomCastListTextWidget(text: tv.overview, maxLines: 4),
                            const SizedBox(height: 5.0),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
