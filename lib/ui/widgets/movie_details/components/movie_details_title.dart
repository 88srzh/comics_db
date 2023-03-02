// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';

class MovieDetailsTitle extends StatelessWidget {
  const MovieDetailsTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.titleText,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
