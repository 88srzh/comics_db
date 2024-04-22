// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';

class TvSeasonsListWidget extends StatefulWidget {
  const TvSeasonsListWidget({super.key});

  @override
  State<TvSeasonsListWidget> createState() => _TvSeasonsListWidgetState();
}

class _TvSeasonsListWidgetState extends State<TvSeasonsListWidget> {
  late Future<String> lazyValue;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future<String> loadingDelay() {
      Duration duration = const Duration(seconds: 2);

      return Future.delayed(duration, () => 'It took ${duration.inSeconds}');
    }

    lazyValue = loadingDelay();
    final locale = Localizations.localeOf(context);
    context.read<TvDetailsCubit>().setupTvDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<TvDetailsCubit>();
    var seasonsData = cubit.data.seasonData;
    if (seasonsData.isEmpty) return const SizedBox.shrink();
    final String name = cubit.state.name;
    return FutureBuilder(
      future: lazyValue,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: CustomDetailsAppBar(title: name),
          body: Stack(
            children: [
              ListView.builder(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(top: 70.0),
                itemCount: seasonsData.length,
                itemExtent: 165,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    // onTap: () => cubit.onMovieTap(context, index),
                    child: _TvDetailsSeasonsListRowWidget(
                      index: index,
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                // child: CustomSearchBar(onChanged: cubit.searchPopularMovie),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TvDetailsSeasonsListRowWidget extends StatelessWidget {
  final int index;

  const _TvDetailsSeasonsListRowWidget({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.read<ThemeBloc>().isDarkTheme;
    final cubit = context.read<TvDetailsCubit>();
    final seasonData = cubit.data.seasonData[index];
    final posterPath = seasonData.posterPath;
    final name = seasonData.name;
    final String? airDate = seasonData.airDate;
    final String overview = seasonData.overview;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Stack(
        children: [
          Container(
            decoration: isDarkTheme ? customMovieListBoxDecorationForDarkTheme : customMovieListBoxDecorationForLightTheme,
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                posterPath != null
                    ? Image.network(
                        ImageDownloader.imageUrl(posterPath),
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
                        text: name,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5.0),
                      CustomCastListTextWidget(
                        text: airDate.toString(),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 15.0),
                      CustomCastListTextWidget(
                        text: overview,
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
