import 'package:flutter/material.dart';

class CustomTvDetailsTitleGenresRatingVoteAverageWidget extends StatelessWidget {
  final String text;

  const CustomTvDetailsTitleGenresRatingVoteAverageWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
