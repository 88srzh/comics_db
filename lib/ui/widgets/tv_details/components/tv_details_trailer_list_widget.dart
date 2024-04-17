import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/components/custom_tv_details_icon_widget.dart';
import 'package:comics_db_app/ui/components/custom_tv_details_title_genres_rating_vote_average_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/tv_trailer/tv_trailer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TvDetailsTrailerListWidget extends StatelessWidget {
  const TvDetailsTrailerListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvDetailsCubit>();
    late String youtubeKey = cubit.state.videosData.first.key;
    final rating = cubit.state.rating;
    if (cubit.state.videosData.isEmpty) return const SizedBox.shrink();
    return InkWell(
      onTap: () {
        showDialog<Widget>(
          context: context,
          builder: (context) => Stack(
            children: [
              Positioned(
                top: 250.0,
                child: TvDetailsTrailerWidget(tvYoutubeKey: youtubeKey),
              ),
            ],
          ),
        );
      },
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rating!.isNotEmpty ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                rating,
                style: TextStyle(
                  fontSize: 13,
                  color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor,
                ),
              ),
            ),
          ) : const SizedBox.shrink(),
          const SizedBox(width: 5.0),
          CustomTvDetailsIconWidget(icon: MdiIcons.youtube),
          const SizedBox(width: 4.0),
          const CustomTvDetailsTitleGenresRatingVoteAverageWidget(text: 'Play Trailer'),
        ],
      ),
    );
  }
}
