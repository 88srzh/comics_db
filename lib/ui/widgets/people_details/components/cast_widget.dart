import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';
import 'package:flutter/material.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Characters',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: AppColors.genresText,
                ),
              ),
            ),
            SizedBox(
              height: 250.0,
              child: Scrollbar(
                child: _PeopleActorListWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PeopleActorListWidget extends StatelessWidget {
  const _PeopleActorListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var actorsData = context.select((MovieDetailsModel model) => model.data.actorsData);
    var actorsData = context.watch<PeopleDetailsCubit>().data.actorsData;
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
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
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
              profilePath != null ? Image.network(ImageDownloader.imageUrl(profilePath)) : const Image(image: AssetImage(AppImages.noImage)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        actor.name,
                        maxLines: 1,
                        style: const TextStyle(color: AppColors.genresText),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        actor.character,
                        maxLines: 2,
                        style: const TextStyle(color: AppColors.genresText),
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