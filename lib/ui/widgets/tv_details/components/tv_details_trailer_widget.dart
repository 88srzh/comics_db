import 'package:comics_db_app/ui/components/custom_tv_details_icon_widget.dart';
import 'package:comics_db_app/ui/components/custom_tv_details_title_genres_rating_vote_average_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/tv_trailer/tv_trailer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TvTrailerListWidget extends StatelessWidget {
  const TvTrailerListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvDetailsCubit>();
    late String youtubeKey = cubit.state.videosData.first.key;
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
      // onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.tvTrailer, arguments: youtubeKey),
      // onTap: => {return TvTrailerYoutubeWidget(youtubeKey: trailerKey),}
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CustomTvDetailsIconWidget(icon: MdiIcons.youtube),
          SizedBox(width: 4),
          CustomTvDetailsTitleGenresRatingVoteAverageWidget(text: 'Play Trailer'),
        ],
      ),
    );
  }
}
