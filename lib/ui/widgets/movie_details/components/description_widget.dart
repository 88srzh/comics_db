// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_description_expandable_text_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieDetailsCubit>();
    var overview = cubit.state.overview;
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
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
                    child: CustomDescriptionExpandableText(description: overview),
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
