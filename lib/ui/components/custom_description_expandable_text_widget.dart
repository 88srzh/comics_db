// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:expandable_text/expandable_text.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:provider/provider.dart';

class CustomDescriptionExpandableText extends StatelessWidget {
  final String description;

  const CustomDescriptionExpandableText({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return ExpandableText(
          description,
          expandText: '',
          maxLines: 5,
          linkColor: Colors.deepOrangeAccent,
          animation: true,
          expandOnTextTap: true,
          prefixText: ' ',
          linkEllipsis: false,
          style: TextStyle(
            color: notifierTheme.isDark ? AppColors.genresText : AppColors.kPrimaryColor,
            fontSize: 12,
          ),
        );
      },
    );
  }
}
