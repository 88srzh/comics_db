// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:expandable_text/expandable_text.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';

class CustomDescriptionExpandableText extends StatelessWidget {
  final String description;

  const CustomDescriptionExpandableText({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      description,
      expandText: '',
      maxLines: 5,
      linkColor: Colors.deepOrangeAccent,
      animation: true,
      expandOnTextTap: true,
      prefixText: ' ',
      linkEllipsis: false,
      style: const TextStyle(
        color: AppColors.genresText,
        fontSize: 12,
      ),
    );
  }
}
