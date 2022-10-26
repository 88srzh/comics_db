import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeopleTopPosterWidget extends StatelessWidget {
  const PeopleTopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PeopleDetailsCubit>();
    final profilePath = cubit.state.profilePath;
    final name = cubit.state.name;
    final knownFor = cubit.state.knownForDepartment;
    final gender = cubit.state.gender;
    final birthday = cubit.state.birthday;
    final placeOfBirth = cubit.state.placeOfBirth;
    // TODO whether it is necessary
    // final alsoKnownAs = cubit.state.alsoKnownAs;
    final popularity = cubit.state.popularity;

    return Stack(
      children: [
      // TODO delete this pic
        Positioned(
          child: Opacity(
            opacity: 0.01,
            child: AspectRatio(
              aspectRatio: 390 / 220,
              child: CachedNetworkImage(
                imageUrl: ImageDownloader.imageUrl(profilePath!),
                placeholder: (context, url) => const LoadingIndicatorWidget(),
                errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageBig),
              ),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 10,
          child: SizedBox(
            height: 300,
            width: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 25,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            name,
                            // '123',
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 21,
                              color: AppColors.titleText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 210,
                        child: Text(
                          knownFor,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 13,
                            color: AppColors.titleText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        birthday ?? 'no birthday',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.genresText,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    placeOfBirth ?? 'no place of birth',
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.genresText,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      MdiIcons.starOutline,
                      color: AppColors.ratingStar,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      // popularity.toString(),
                      popularity.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.ratingText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      MdiIcons.heartOutline,
                      color: AppColors.ratingThumb,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      popularity.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.ratingText,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          // top: 55,
          left: 122,
          child: SizedBox(
            //     TODO: не закругляются края
            height: 220.0,
            width: 390.0,
            child: CachedNetworkImage(
              imageUrl: ImageDownloader.imageUrl(profilePath),
              placeholder: (context, url) => const LoadingIndicatorWidget(),
              errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageBig),
            ),
          ),
        ),
      ],
    );
  }
}
