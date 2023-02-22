// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';

class TvDescriptionWidget extends StatelessWidget {
  const TvDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final overview = context.select((TvDetailsModel model) => model.tvData.overview);
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sinopsis',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  // TODO rename text
                  color: notifierTheme.isDark ? AppColors.genresText : AppColors.kPrimaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    // Добавить расстояние между строками
                    child: Text(
                      overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                        color: notifierTheme.isDark ? AppColors.genresText : AppColors.kPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
