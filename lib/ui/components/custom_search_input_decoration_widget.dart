// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:flutter/material.dart';

InputDecoration customSearchInputDecoration({required String text}) {
  return InputDecoration(
    labelText: text,
    labelStyle: const TextStyle(
      color: DarkThemeColors.genresText,
    ),
    filled: true,
    fillColor: DarkThemeColors.kPrimaryColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
    ),
  );
}

InputDecoration customSearchInputDecorationForLightTheme(
    {required String text}) {
  return InputDecoration(
    labelText: text,
    labelStyle: TextStyle(
      color: Colors.black.withOpacity(0.2),
    ),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
    ),
  );
}
