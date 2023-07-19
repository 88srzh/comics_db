// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/trending/trending_list_cubit.dart';

class TrendingWidget extends StatefulWidget {
  const TrendingWidget({Key? key}) : super(key: key);

  @override
  State<TrendingWidget> createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<TrendingListCubit>().setupTrendingLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<TrendingListCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Trending'),
      body: Stack(
        children: [
          TrendingPageListWidget(cubit: cubit),
          TrendingAnimatedButtonBarWidget(cubit: cubit),
        ],
      ),
    );
  }
}

class TrendingAnimatedButtonBarWidget extends StatelessWidget {
  const TrendingAnimatedButtonBarWidget({
    super.key,
    required this.cubit,
  });

  final TrendingListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.0,
          width: 200.0,
          child: AnimatedButtonBar(
            radius: 8.0,
            backgroundColor: Colors.white,
            foregroundColor: DarkThemeColors.kPrimaryColor.withOpacity(0.2),
            elevation: 10,
            borderColor: Colors.white,
            borderWidth: 2.0,
            animationDuration: const Duration(milliseconds: 400),
            children: [
              ButtonBarEntry(
                child: const Text(
                  'All',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () => cubit.showedTrendingAllThisWeek(),
              ),
              ButtonBarEntry(
                child: const Text(
                  'Movies',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () => cubit.showedTrendingMoviesThisWeek(),
              ),
              ButtonBarEntry(
                child: const Text(
                  'TV',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () => cubit.showedTrendingTvThisWeek(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TrendingPageListWidget extends StatelessWidget {
  const TrendingPageListWidget({
    super.key,
    required this.cubit,
  });

  final TrendingListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 70.0, bottom: 8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 3,
        mainAxisSpacing: 5,
        crossAxisCount: 3,
        childAspectRatio: 1 / 2,
      ),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: cubit.state.trendingList.length,
      itemBuilder: (BuildContext context, int index) {
        cubit.showedTrendingAtIndex(index);
        final trending = cubit.state.trendingList[index];
        final posterPath = trending.posterPath;
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
                    posterPath.isNotEmpty
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
                            CustomCastListTextWidget(text: trending.title ?? trending.name, maxLines: 2),
                            CustomCastListTextWidget(
                              text: trending.releaseData.isNotEmpty ? trending.releaseData : trending.firstAirDate,
                              maxLines: 1,
                            ),
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
      },
    );
  }
}
