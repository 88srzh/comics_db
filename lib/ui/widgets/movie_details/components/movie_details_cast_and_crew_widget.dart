// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsCastWidget extends StatelessWidget {
  const MovieDetailsCastWidget({super.key});

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
                onTap: () => cubit.onDetailsTap(context, index),
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
  const _MovieActorListWidget();

  @override
  Widget build(BuildContext context) {
    var actorsData = context.watch<MovieDetailsCubit>().data.actorsData;
    if (actorsData.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: 8,
      itemExtent: 120,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _MovieActorListItemWidget(actorIndex: index);
      },
    );
  }
}

class _MovieActorListItemWidget extends StatelessWidget {
  final int actorIndex;

  const _MovieActorListItemWidget({required this.actorIndex});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieDetailsCubit>();
    final actor = cubit.data.actorsData[actorIndex];
    final actorId = actor.id;
    final profilePath = actor.profilePath;
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.peopleDetails, arguments: actorId),
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
                profilePath != null ? Image.network(ImageDownloader.imageUrl(profilePath)) : const Image(image: AssetImage(AppImages.noImageAvailable)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCastListTextWidget(
                          text: actor.name,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 7.0),
                        CustomCastListTextWidget(
                          text: actor.character,
                          maxLines: 2,
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
