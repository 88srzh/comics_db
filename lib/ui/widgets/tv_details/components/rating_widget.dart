import 'package:comics_db_app/ui/components/custom_tv_details_icon_widget.dart';
import 'package:comics_db_app/ui/components/custom_tv_details_title_genres_rating_vote_average_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class RatingsRowWidget extends StatelessWidget {
  const RatingsRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<TvDetailsCubit>();
    final voteAverage = cubit.state.voteAverage;
    final voteCount = cubit.state.voteCount;
    final popularity = cubit.state.popularity;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomTvDetailsIconWidget(icon: MdiIcons.starOutline),
        const SizedBox(width: 2),
        CustomTvDetailsTitleGenresRatingVoteAverageWidget(text: voteAverage.toString()),
        const CustomTvDetailsTitleGenresRatingVoteAverageWidget(text: ' / 10'),
        const SizedBox(width: 20),
        const CustomTvDetailsIconWidget(icon: MdiIcons.accountOutline),
        const SizedBox(width: 2),
        CustomTvDetailsTitleGenresRatingVoteAverageWidget(text: voteCount.toStringAsFixed(0)),
        const SizedBox(width: 20),
        const CustomTvDetailsIconWidget(icon: MdiIcons.heartOutline),
        const SizedBox(width: 2),
        CustomTvDetailsTitleGenresRatingVoteAverageWidget(text: popularity.toStringAsFixed(0)),
      ],
    );
  }
}

