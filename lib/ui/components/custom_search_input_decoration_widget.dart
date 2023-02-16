// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:provider/provider.dart';

InputDecoration customSearchInputDecoration({required String text}) {
  return InputDecoration(
    labelText: text,
    labelStyle: const TextStyle(
      color: AppColors.genresText,
    ),
    filled: true,
    fillColor: AppColors.kPrimaryColor,
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
InputDecoration customSearchInputDecorationForLightTheme ({required String text}) {
  return InputDecoration(
    labelText: text,
    labelStyle: const TextStyle(
      color: AppColors.genresText,
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
