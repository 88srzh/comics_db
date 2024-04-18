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
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_season_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';

class TvSeasonsListWidget extends StatefulWidget {
  const TvSeasonsListWidget({super.key});

  @override
  State<TvSeasonsListWidget> createState() => _TvSeasonsListWidgetState();
}

class _TvSeasonsListWidgetState extends State<TvSeasonsListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<TvDetailsCubit>().setupTvDetailsLocale(context, locale.languageCode);
  }
  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<TvDetailsCubit>();
    return Scaffold(
      appBar: const CustomDetailsAppBar(title: 'Popular Movies'),
      body: Stack(
        children: [
          ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 70.0),
            itemCount: cubit.state.seasons.length,
            itemExtent: 165,
            itemBuilder: (BuildContext context, int index) {
              cubit.state.seasons[index];
              final tv = cubit.state.seasons[index];
              final posterPath = tv.posterPath;
              return InkWell(
                // onTap: () => cubit.onMovieTap(context, index),
                child: _TvDetailsSeasonsListRowWidget(
                  posterPath: posterPath,
                  tvData: tv,
                  cubit: cubit,
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
  }
}
class _TvDetailsSeasonsListRowWidget extends StatelessWidget {
  final int index;

  const _TvDetailsSeasonsListRowWidget({
    required this.posterPath,
    required this.tvData,
    required this.cubit,
    required this.index,
  });

  final String? posterPath;
  final TvDetailsSeasonData tvData;
  final TvDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.read<ThemeBloc>().isDarkTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Stack(
        children: [
          Container(
            decoration:
            isDarkTheme ? customMovieListBoxDecorationForDarkTheme : customMovieListBoxDecorationForLightTheme,
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
                        text: tvData.name,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5.0),
                      CustomCastListTextWidget(
                        text: tvData.airDate.toString(),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 15.0),
                      CustomCastListTextWidget(
                        text: tvData.overview,
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
