import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TvDetailsSeasonsWidget extends StatelessWidget {
  final String currentSeason;

  const TvDetailsSeasonsWidget({super.key, required this.currentSeason});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<TvDetailsCubit>();
    final String? posterPath = cubit.state.seasons.first.posterPath;
    // TODO need to fix season number
    final int seasonNumber = cubit.state.seasons.first.seasonNumber + 1;
    // TODO add to separate file
    Color textColor = context.read<ThemeBloc>().isDarkTheme ? Colors.white : DarkThemeColors.kPrimaryColor;
    Color reverseTextColor = context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(currentSeason, style: Theme.of(context).textTheme.titleMedium),
          Stack(
            children: [
              Container(
                decoration: context.read<ThemeBloc>().isDarkTheme ? customMovieListBoxDecorationForDarkTheme : customMovieListBoxDecorationForLightTheme,
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    posterPath != null ? Image.network(ImageDownloader.imageUrl(posterPath), width: 95.0) : Image.asset(AppImages.noImageAvailable),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              CustomCastListTextWidget(text: 'Season $seasonNumber', maxLines: 1),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: textColor,
                                      border: Border.all(
                                        color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
                                      ),
                                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Row(
                                        children: [
                                          Icon(MdiIcons.star, size: 14, color: reverseTextColor),
                                          Text(
                                            '86%',
                                            style: TextStyle(color: reverseTextColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5.0),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: Text(
                                    '2024 dot 8 episodes',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          const CustomCastListTextWidget(text: 'Сезон 1 сериала такой-то такой-то, вышел 18 января 2024.', maxLines: 3),
                          const SizedBox(height: 5.0),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15.0),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
