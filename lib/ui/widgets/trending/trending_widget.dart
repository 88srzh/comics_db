import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/trending/trending_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: ColoredBox(
        color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 3,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.9,
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
                    // TODO create separate custom widget, also used in people widget
                    decoration: BoxDecoration(
                      color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
                      border: Border.all(
                        color: context.read<ThemeBloc>().isDarkTheme
                            ? Colors.white.withOpacity(0.2)
                            : Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: [
                        BoxShadow(
                          color: context.read<ThemeBloc>().isDarkTheme
                              ? Colors.white.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1),
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
                            padding:  const EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomCastListTextWidget(text: trending.title ?? '', maxLines: 2),
                                CustomCastListTextWidget(text: trending.releaseData, maxLines: 1),
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
        ),
      ),
    );
  }
}
