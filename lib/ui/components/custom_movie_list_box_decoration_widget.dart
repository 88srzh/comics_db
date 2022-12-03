import 'package:comics_db_app/app_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration customMovieListBoxDecoration = BoxDecoration(
  color: AppColors.kPrimaryColor,
  border: Border.all(color: Colors.white.withOpacity(0.2)),
  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.white.withOpacity(0.1),
      blurRadius: 8,
      offset: const Offset(0, 2),
    )
  ],
);
