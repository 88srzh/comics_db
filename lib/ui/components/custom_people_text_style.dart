// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:flutter/material.dart';

class CustomPeopleTextStyle {
  var nameStyle = const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  var jobStyle = const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  var nameStyleLightTheme = const TextStyle(
    color: DarkThemeColors.kPrimaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  var jobStyleLightTheme = const TextStyle(
      color: DarkThemeColors.kPrimaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w700);
}
