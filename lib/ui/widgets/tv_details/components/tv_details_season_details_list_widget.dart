import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/generated/l10n.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';
import 'package:comics_db_app/ui/widgets/tv_seasons/components/tv_season_data.dart';
import 'package:comics_db_app/ui/widgets/tv_seasons/tv_season_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TvDetailsSeasonDetailsListWidget extends StatefulWidget {
  const TvDetailsSeasonDetailsListWidget({super.key});

  @override
  State<TvDetailsSeasonDetailsListWidget> createState() => _TvDetailsSeasonDetailsListWidgetState();
}

class _TvDetailsSeasonDetailsListWidgetState extends State<TvDetailsSeasonDetailsListWidget> {
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
    context.read<TvSeasonCubit>().setupTvSeasonLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<TvSeasonCubit>();
    return FutureBuilder(
      future: lazyValue,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: const CustomDetailsAppBar(title: '123'),
          body: Stack(
            children: [
              ListView.builder(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                // padding: const EdgeInsets.only(top: 70.0),
                itemCount: cubit.state.seasonData.length,
                itemExtent: 165,
                itemBuilder: (BuildContext context, int index) {
                  cubit.showedAllEpisodesAtIndex(index);
                  final episode = cubit.state.seasonData[index];
                  final String? stillPath = episode.stillPath;
                  // final int  seasonId = seasonsData[index].id;
                  // final int seasonNumber = seasonsData[index].seasonNumber;
                  return InkWell(
                    // onTap: () => cubit.on(context, index),
                    child: _TvDetailsSeasonDetailsListRowWidget(
                      stillPath: stillPath,
                      index: index,
                      episode: episode,
                      cubit: cubit,
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

class _TvDetailsSeasonDetailsListRowWidget extends StatelessWidget {
  final int index;

  const _TvDetailsSeasonDetailsListRowWidget({
    required this.index,
    required this.stillPath,
    required this.episode,
    required this.cubit,
  });

  final String? stillPath;
  final TvSeasonDetailsData episode;
  final TvSeasonCubit cubit;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.read<ThemeBloc>().isDarkTheme;
    final cubit = context.read<TvSeasonCubit>();
    final seasonData = cubit.state.seasonData[index];
    final posterPath = seasonData.stillPath;
    final String name = seasonData.name;
    final String overview = seasonData.overview;
    final String originalName = seasonData.name;
    final double voteAverage = seasonData.voteAverage;
    final double? voteAveragePercent = voteAverage != null ? voteAverage * 10 : null;
    // final String airDateByYear = seasonData.airDate != null ? DateFormat.y().format(seasonData.airDate) : '-';
    late final int episodeNumber = seasonData.episodeNumber;
    // final String? fullAirDate = seasonData.fullAirDate != null ? DateFormat.yMMMMd().format(seasonData.airDate) : null;
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
                                // child: Text(
                                  // '$airDateByYear • $episodeNumber ${S.of(context).episodes}',
                                  // style: Theme.of(context).textTheme.headlineMedium,
                                // ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        // CustomCastListTextWidget(text: '$name сериала "$originalName", вышел $airDateByYear.', maxLines: 3),
                        // : CustomCastListTextWidget(text: S.of(context).seasonOverview, maxLines: 4),
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
