import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomHeaderTextWidget extends StatelessWidget {
  final String text;

  const CustomHeaderTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        return Text(
          text,
          style: TextStyle(
            color: themeNotifier.isDark ? AppColors.genresText : AppColors.kPrimaryColor,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        );
      },
    );
  }
}
