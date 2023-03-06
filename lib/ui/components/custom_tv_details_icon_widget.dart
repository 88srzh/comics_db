import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:flutter/material.dart';

class CustomTvDetailsIconWidget extends StatelessWidget {
  final IconData icon;

  const CustomTvDetailsIconWidget({Key? key, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: DarkThemeColors.ratingThumb,
      size: 14,
    );
  }
}
