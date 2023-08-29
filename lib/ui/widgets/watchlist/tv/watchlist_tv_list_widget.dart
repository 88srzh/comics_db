import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
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

  final WatchlistTVCubit cubit;

  @override
  Widget build(BuildContext context) {
    // final cubit = context.watch<WatchlistCubit>();
    return GridView.builder(
        padding: const EdgeInsets.only(top: 70.0, bottom: 8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 5,
          childAspectRatio: 1 / 2,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: cubit.state.tvs.length,
        itemBuilder: (BuildContext context, int index) {
          cubit.showedWatchlistTVAtIndex(index);
          final tv = cubit.state.tvs[index];
          final posterPath = tv.posterPath;
          return InkWell(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
                    border: Border.all(
                      color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                        color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomCastListTextWidget(text: tv.name, maxLines: 2),
                              CustomCastListTextWidget(text: tv.firstAirDate, maxLines: 1),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
