// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_text_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return ColoredBox(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Full Cast & Crew',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: notifierTheme.isDark ? AppColors.genresText : AppColors.headerText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 250.0,
                  child: Scrollbar(
                    child: _MovieActorListWidget(),
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

class _MovieActorListWidget extends StatelessWidget {
  const _MovieActorListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var actorsData = context.watch<MovieDetailsCubit>().data.actorsData;
    if (actorsData.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: actorsData.length,
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

  const _MovieActorListItemWidget({Key? key, required this.actorIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailsCubit>();
    final actor = model.data.actorsData[actorIndex];
    final profilePath = actor.profilePath;
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: notifierTheme.isDark ? AppColors.kPrimaryColor : Colors.white,
              border: Border.all(
                  color: notifierTheme.isDark ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2)),
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
                  profilePath != null
                      ? Image.network(ImageDownloader.imageUrl(profilePath))
                      : const Image(image: AssetImage(AppImages.noImageAvailable)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomMovieListTextWidget(
                            text: actor.name,
                            maxLines: 1,
                            fontSize: 13,
                            // TODO may be i can replace this to custom widget
                            color: notifierTheme.isDark ? AppColors.genresText : AppColors.headerText,
                            fontWeight: null,
                          ),
                          const SizedBox(height: 7),
                          CustomMovieListTextWidget(
                            text: actor.character,
                            maxLines: 2,
                            fontSize: 12,
                            color: notifierTheme.isDark ? AppColors.genresText : AppColors.headerText,
                            fontWeight: null,
                          ),
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
