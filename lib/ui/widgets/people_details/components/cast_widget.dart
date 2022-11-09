import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                'Known For',
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
    var charactersData = context.watch<PeopleDetailsCubit>().data.charactersData;
    if (charactersData.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: charactersData.length,
      itemExtent: 120,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _MovieActorListItemWidget(characterIndex: index);
      },
    );
  }
}

class _MovieActorListItemWidget extends StatelessWidget {
  final int characterIndex;

  const _MovieActorListItemWidget({Key? key, required this.characterIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<PeopleDetailsCubit>();
    final character = model.data.charactersData[characterIndex];
    final posterPath = character.posterPath;
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
              posterPath != null ? Image.network(ImageDownloader.imageUrl(posterPath)) : const Image(image: AssetImage(AppImages.noImage)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.title,
                        maxLines: 1,
                        style: const TextStyle(color: AppColors.genresText),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        character.character,
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