// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_genres_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_rating_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_title_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_trailer_list_widget.dart';

class TvDetailsTitleGenresRatingVoteAverageWidget extends StatelessWidget {
  const TvDetailsTitleGenresRatingVoteAverageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children:  [
          SizedBox(height: 12),
          TvDetailsTitleWidget(),
          SizedBox(height: 8),
          TvDetailsGenresWidget(),
          SizedBox(height: 4),
          TvDetailsRatingsRowWidget(),
          SizedBox(height: 4),
          TvDetailsTrailerListWidget(),
        ],
      ),
    );
  }
}
