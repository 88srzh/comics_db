// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/favorite_screen/tv/favorite_tv_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';

class FavoriteTvListWidget extends StatefulWidget {
  const FavoriteTvListWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteTvListWidget> createState() => _FavoriteTvListWidgetState();
}

class _FavoriteTvListWidgetState extends State<FavoriteTvListWidget> {
  @override
  void didChangeDependencies() {
    final locale = Localizations.localeOf(context);
    context.read<FavoriteTvListCubit>().setupFavoriteTvLocale(locale.languageCode);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<FavoriteTvListCubit>();
    final locale = Localizations.localeOf(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35.0))),
        child: const Icon(IconData(0xf00e9, fontFamily: 'MaterialIcons')),
        onPressed: () => setState(() {
          cubit.updateFavoriteTvs(locale.languageCode);
        }),
      ),
      appBar: const CustomAppBar(title: 'Favorite TV Shows'),
      body: Stack(
        children: [
          ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: cubit.state.tvs.length,
            itemExtent: 165,
            itemBuilder: (BuildContext context, int index) {
              cubit.showedFavoriteTvAtIndex(index);
              final tv = cubit.state.tvs[index];
              final posterPath = tv.posterPath;
              return InkWell(
                onTap: () => onTvTap(context, index),
                child: _FavoriteTvListRowWidget(posterPath: posterPath, tv: tv, cubit: cubit, index: index),
              );
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          //   child: CustomSearchBar(onChanged: cubit.searchFavoriteMovie),
          // ),
        ],
      ),
    );
  }

  void onTvTap(BuildContext context, int index) {
    final cubit = context.read<FavoriteTvListCubit>();
    final tvId = cubit.state.tvs[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.tvDetails, arguments: tvId);
  }
}

class _FavoriteTvListRowWidget extends StatelessWidget {
  final int index;

  const _FavoriteTvListRowWidget({
    Key? key,
    required this.posterPath,
    required this.tv,
    required this.cubit,
    required this.index,
  }) : super(key: key);

  final String? posterPath;
  final TvListData tv;
  final FavoriteTvListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Stack(
        children: [
          Container(
            decoration: context.read<ThemeBloc>().isDarkTheme
                ? customMovieListBoxDecorationForDarkTheme
                : customMovieListBoxDecorationForLightTheme,
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
                        text: tv.name,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5.0),
                      CustomCastListTextWidget(
                        text: tv.firstAirDate ?? '',
                        maxLines: 1,
                      ),
                      const SizedBox(height: 15.0),
                      CustomCastListTextWidget(
                        text: tv.overview,
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
