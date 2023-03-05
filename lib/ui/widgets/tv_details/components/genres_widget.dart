import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genres =
        context.select((TvDetailsModel model) => model.tvData.genres);
    return Text(
      genres,
      maxLines: 3,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 13,
        color: DarkThemeColors.genresText,
      ),
    );
  }
}
