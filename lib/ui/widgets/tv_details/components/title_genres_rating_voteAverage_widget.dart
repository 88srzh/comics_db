// Flutter imports:
import 'package:comics_db_app/ui/widgets/tv_details/components/genres_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/rating_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/title_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_trailer_widget.dart';
import 'package:flutter/material.dart';

class TitleGenresRatingVoteAverageWidget extends StatelessWidget {
  const TitleGenresRatingVoteAverageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 12),
          TitleWidget(),
          SizedBox(height: 8),
          GenresWidget(),
          SizedBox(height: 4),
          RatingsRowWidget(),
          SizedBox(height: 4),
          TvTrailerWidget(),
        ],
      ),
    );
  }
}