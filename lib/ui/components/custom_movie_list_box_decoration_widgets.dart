// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';

// TODO: need to optimize code, not clean!
BoxDecoration customMovieListBoxDecorationForDarkTheme = BoxDecoration(
  color: AppColors.kPrimaryColor,
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
  color: Colors.white70,
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
