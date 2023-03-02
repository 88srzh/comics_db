import 'package:comics_db_app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTvDetailsTitleGenresRatingVoteAverageWidget extends StatelessWidget {
  final String text;

  const CustomTvDetailsTitleGenresRatingVoteAverageWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        color: AppColors.ratingText,
      ),
    );
  }
}
