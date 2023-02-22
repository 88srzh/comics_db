// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:provider/provider.dart';

class CustomPosterTopLeftAlignTextRating extends StatelessWidget {
  final String text;

  const CustomPosterTopLeftAlignTextRating({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Align(
          alignment: Alignment.topLeft,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: notifierTheme.isDark ? AppColors.genresText : AppColors.kPrimaryColor,
            ),
          ),
        );
      },
    );
  }
}
