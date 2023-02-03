// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/character_data.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';
import 'package:provider/provider.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var charactersData = context.watch<PeopleDetailsCubit>().data.charactersData;
    if (charactersData.isEmpty) return const SizedBox.shrink();
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return ColoredBox(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Known For',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: notifierTheme.isDark ? AppColors.genresText : AppColors.headerText,
                    ),
                  ),
                ),
                SizedBox(
                  height: 260.0,
                  child: Scrollbar(
                    child: _PeopleActorListWidget(charactersData: charactersData),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
    final posterPath = character.posterPath;
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              border: Border.all(color: Colors.white.withOpacity(0.2)),
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
                  // : const SizedBox.shrink(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomMovieListTextWidget(
                              text: character.title,
                              maxLines: 1,
                              fontSize: 13,
                              color: AppColors.genresText,
                              fontWeight: null),
                          const SizedBox(height: 3),
                          CustomMovieListTextWidget(
                              text: character.character,
                              maxLines: 2,
                              fontSize: 12,
                              color: AppColors.genresText,
                              fontWeight: null),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
