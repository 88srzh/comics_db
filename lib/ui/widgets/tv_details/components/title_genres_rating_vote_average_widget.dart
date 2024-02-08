// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/tv_details/components/genres_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/rating_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/title_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_trailer_widget.dart';

class TitleGenresRatingVoteAverageWidget extends StatelessWidget {
  const TitleGenresRatingVoteAverageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children:  [
          SizedBox(height: 12),
          TitleWidget(),
          SizedBox(height: 8),
          GenresWidget(),
          SizedBox(height: 4),
          RatingsRowWidget(),
          SizedBox(height: 4),
          TvTrailerListWidget(),
        ],
      ),
    );
  }
}
