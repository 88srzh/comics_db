import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genres = context.select((TvDetailsModel model) => model.tvData.genres);
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Text(
          genres,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: notifierTheme.isDark ? AppColors.genresText : AppColors.kPrimaryColor,
          ),
        );
      },
    );
  }
}
