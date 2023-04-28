// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';

class TvCastWidget extends StatelessWidget {
  const TvCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var actorsData = context.watch<TvDetailsCubit>().state.peopleData;
    if (actorsData.isNotEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Full Cast & Crew',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 250.0,
            child: Scrollbar(child: _TvActorListWidget()),
          ),
        ],
      ),
    );
  }
}

class _TvActorListWidget extends StatelessWidget {
  const _TvActorListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var peopleData = context.watch<TvDetailsCubit>().state.peopleData;
    if (peopleData.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: peopleData.length,
      itemExtent: 120,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _TvActorListItemWidget(actorIndex: index);
      },
    );
  }
}

class _TvActorListItemWidget extends StatelessWidget {
  final int actorIndex;

  const _TvActorListItemWidget({Key? key, required this.actorIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TvDetailsCubit>();
    var actor = cubit.data.actorsData[actorIndex];
    final backdropPath = actor.profilePath;
    final bool isDarkTheme = context.read<ThemeBloc>().isDarkTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
          border: Border.all(
            color: isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
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
              backdropPath != null
                  ? Image.network(ImageDownloader.imageUrl(backdropPath))
                  : const Image(image: AssetImage(AppImages.noImage)),
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
    );
  }
}
