// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';

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
          color: AppColors.genresText,
        ),
      ),
    );
  }
}
