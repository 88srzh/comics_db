import 'package:comics_db_app/core/app_colors.dart';
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvNameData =
        context.select((TvDetailsModel model) => model.tvData.tvNameData);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tvNameData.name,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
                color: AppColors.titleText,
              ),
            ),
            const SizedBox(width: 2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tvNameData.tagline,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: DarkThemeColors.genresText,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
