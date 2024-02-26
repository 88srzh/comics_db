import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsSimilarWidget extends StatelessWidget {
  const MovieDetailsSimilarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieDetailsCubit>();
    var index = cubit.state.id;
    // var actorsData = context.watch<MovieDetailsCubit>().data.actorsData;
    // if (actorsData.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Top Billed Cast',
                  style: Theme.of(context).textTheme.titleMedium,
              ),
              InkWell(
                onTap: () => cubit.tapToSeeFullCastAndCrewList(context, index),
                child: Text(
                  'See all',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              )
            ],
          ),
          const SizedBox(height: 8.0),
          const SizedBox(
            height: 250.0,
            child: Scrollbar(
              child: _MovieActorListWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieActorListWidget extends StatelessWidget {
  const _MovieActorListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var similarData = context.watch<MovieDetailsCubit>().data.similarData;
    if (similarData.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: 9,
      itemExtent: 120,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _MovieActorListItemWidget(index: index);
      },
    );
  }
}

class _MovieActorListItemWidget extends StatelessWidget {
  final int index;

  const _MovieActorListItemWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieDetailsCubit>();
    final movie = cubit.data.similarData[index];
    final movieId = movie.id;
    final posterPath = movie.posterPath;
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.peopleDetails, arguments: movieId),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
            border: Border.all(
              color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                posterPath != null ? Image.network(ImageDownloader.imageUrl(posterPath)) : const Image(image: AssetImage(AppImages.noImageAvailable)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCastListTextWidget(
                          text: movie.title,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}