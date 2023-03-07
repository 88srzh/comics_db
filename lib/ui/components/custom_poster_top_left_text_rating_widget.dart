// Flutter imports:
import 'package:flutter/material.dart';

class CustomPosterTopLeftAlignTextRating extends StatelessWidget {
  final String text;

  const CustomPosterTopLeftAlignTextRating({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
