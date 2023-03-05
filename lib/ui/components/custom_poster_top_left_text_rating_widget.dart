// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
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
        style: const TextStyle(
          fontSize: 13,
          color: DarkThemeColors.genresText,
        ),
      ),
    );
  }
}
