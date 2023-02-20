import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTvDetailsTitleGenresRatingVoteAverageWidget
    extends StatelessWidget {
  final String text;

  const CustomTvDetailsTitleGenresRatingVoteAverageWidget(
      {Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: notifierTheme.isDark
                ? AppColors.ratingText
                : AppColors.kPrimaryColor,
          ),
        );
      },
    );
  }
}
