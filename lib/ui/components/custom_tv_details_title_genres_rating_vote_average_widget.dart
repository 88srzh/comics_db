import 'package:flutter/material.dart';

class CustomTvDetailsTitleGenresRatingVoteAverageWidget
    extends StatelessWidget {
  final String text;

  const CustomTvDetailsTitleGenresRatingVoteAverageWidget(
      {Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
