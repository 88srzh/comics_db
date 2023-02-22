import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvNameData = context.select((TvDetailsModel model) => model.tvData.tvNameData);
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tvNameData.name,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: notifierTheme.isDark ? AppColors.titleText : AppColors.kPrimaryColor,
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
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: notifierTheme.isDark ? AppColors.genresText : AppColors.kPrimaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
