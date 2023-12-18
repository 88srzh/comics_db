// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/character_data.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<PeopleDetailsCubit>();
    var charactersData = cubit.data.charactersData;
    var id = cubit.state.id;
    if (charactersData.isEmpty) return const SizedBox.shrink();
    return ColoredBox(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Known For',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                InkWell(
                  onTap: () => cubit.onSeeAllKnownForTap(context, id),
                  child: Text(
                    'See all',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 280.0,
              child: Scrollbar(
                child: _PeopleActorListWidget(charactersData: charactersData),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PeopleActorListWidget extends StatelessWidget {
  final List<PeopleDetailsCharacterData> charactersData;

  const _PeopleActorListWidget({Key? key, required this.charactersData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: charactersData.length,
      itemExtent: 120,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _PeopleActorListItemWidget(characterIndex: index);
      },
    );
  }
}

class _PeopleActorListItemWidget extends StatelessWidget {
  final int characterIndex;

  const _PeopleActorListItemWidget({Key? key, required this.characterIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PeopleDetailsCubit>();
    final character = cubit.data.charactersData[characterIndex];
    final characterId = character.id;
    final posterPath = character.posterPath;
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: characterId),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
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
                posterPath != null
                    ? CachedNetworkImage(
                        imageUrl: ImageDownloader.imageUrl(posterPath),
                        placeholder: (context, url) => const LoadingIndicatorWidget(),
                        errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                      )
                    : const Image(image: AssetImage(AppImages.noImageAvailable)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCastListTextWidget(
                          text: character.title,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 7.0),
                        CustomCastListTextWidget(
                          text: character.character,
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
