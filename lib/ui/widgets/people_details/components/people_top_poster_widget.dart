// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_poster_top_left_text_rating_widget.dart';
import 'package:comics_db_app/ui/components/custom_poster_top_left_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';

class PeopleTopPosterWidget extends StatelessWidget {
  const PeopleTopPosterWidget({super.key});

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
    const String female = 'Female';
    const String male = 'Male';

    return Stack(
      children: [
        // TODO delete this pic
        profilePath != null
            ? Positioned(
                child: Opacity(
                  opacity: 0.001,
                  child: AspectRatio(
                    aspectRatio: 390 / 220,
                    child: CachedNetworkImage(
                      imageUrl: ImageDownloader.imageUrl(profilePath),
                      placeholder: (context, url) => const LoadingIndicatorWidget(),
                      errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Positioned(
          top: 45,
          left: 20,
          child: SizedBox(
            height: 320,
            width: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 35,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            name,
                            maxLines: 3,
                            style: Theme.of(context).textTheme.titleMedium,
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
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7.0),
                Row(
                  children: [
                    CustomPosterTopLeftAlignText(
                      text: gender == 1 ? female : male,
                      maxLines: null,
                    )
                  ],
                ),
                Row(
                  children: [
                    CustomPosterTopLeftAlignText(
                      text: birthday ?? 'no birthday',
                      maxLines: null,
                    ),
                  ],
                ),
                CustomPosterTopLeftAlignText(
                  text: placeOfBirth ?? 'no place of birth',
                  maxLines: null,
                ),
                Row(
                  children: [
                    Icon(
                      MdiIcons.starOutline,
                      color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor,
                      size: 14,
                    ),
                    const SizedBox(width: 4.0),
                    CustomPosterTopLeftAlignTextRating(text: popularity.toInt().toString()),
                  ],
                ),
                const SizedBox(height: 2),
              ],
            ),
          ),
        ),
        profilePath != null
            ? Positioned(
                left: 122,
                child: SizedBox(
                  //     TODO: не закругляются края
                  height: 220.0,
                  width: 390.0,
                  child: CachedNetworkImage(
                    imageUrl: ImageDownloader.imageUrl(profilePath),
                    placeholder: (context, url) => const LoadingIndicatorWidget(),
                    errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
