// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:flutter/material.dart';

// TODO: need to optimize code, not clean!
BoxDecoration customMovieListBoxDecorationForDarkTheme = BoxDecoration(
  color: DarkThemeColors.kPrimaryColor,
  border: Border.all(color: Colors.white.withOpacity(0.2)),
  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.white.withOpacity(0.1),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ],
);

BoxDecoration customMovieListBoxDecorationForLightTheme = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.black.withOpacity(0.2)),
  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ],
);
