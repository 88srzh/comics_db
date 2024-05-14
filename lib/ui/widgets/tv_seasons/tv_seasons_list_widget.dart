// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/generated/l10n.dart';
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
                itemCount: seasonsData.length,
                itemExtent: 165,
                itemBuilder: (BuildContext context, int index) {
                  final int  seasonId = seasonsData[index].id;
                  final int seasonNumber = seasonsData[index].seasonNumber;
                  return InkWell(
                    onTap: () => cubit.tapToSeeListOfEpisodes(context, index, seasonNumber),
                    child: _TvDetailsSeasonsListRowWidget(
                      index: index,
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
    final String name = seasonData.name;
    final String overview = seasonData.overview;
    final String originalName = cubit.data.name;
    final double? voteAverage = seasonData.voteAverage;
    final double? voteAveragePercent = voteAverage != null ? voteAverage * 10 : null;
    final String airDateByYear = seasonData.airDate != null ? DateFormat.y().format(seasonData.airDate!) : '-';
    late final int episodeCount = seasonData.episodeCount;
    final String? fullAirDate = seasonData.fullAirDate != null ? DateFormat.yMMMMd().format(seasonData.fullAirDate!) : null;
    Color textColor = context.read<ThemeBloc>().isDarkTheme ? Colors.white : DarkThemeColors.kPrimaryColor;
    Color reverseTextColor = context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white;
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [Text(name, style: Theme.of(context).textTheme.displaySmall)],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Column(
                              children: [
                                voteAverage != null
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: textColor,
                                          border: Border.all(
                                            color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
                                          ),
                                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Row(
                                            children: [
                                              Icon(MdiIcons.star, size: 12, color: reverseTextColor),
                                              Text(
                                                '${voteAveragePercent!.toStringAsFixed(0)}%',
                                                style: TextStyle(color: reverseTextColor, fontSize: 11),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            const SizedBox(width: 5.0),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '$airDateByYear • $episodeCount ${S.of(context).episodes}',
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        fullAirDate != null
                            ? CustomCastListTextWidget(text: '$name сериала "$originalName", вышел $fullAirDate.', maxLines: 3)
                            : CustomCastListTextWidget(text: S.of(context).seasonOverview, maxLines: 4),
                        const SizedBox(height: 5.0),
                        CustomCastListTextWidget(text: overview, maxLines: 2),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
