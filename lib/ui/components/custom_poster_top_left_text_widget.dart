// Flutter imports:
import 'package:flutter/material.dart';

class CustomPosterTopLeftAlignText extends StatelessWidget {
  final String text;
  final int? maxLines;

  const CustomPosterTopLeftAlignText(
      {Key? key, required this.text, required this.maxLines})
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
