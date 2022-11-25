import 'package:comics_db_app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPosterTopLeftTextRating extends StatelessWidget {
  final String text;
  const CustomPosterTopLeftTextRating({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.ratingText,
        ),
      ),
    );
  }
}
