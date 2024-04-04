import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:flutter/material.dart';

FloatingActionButton fabFavorite(VoidCallback onPressed, bool favorite) {
  return FloatingActionButton(
    heroTag: 'favorite',
    elevation: 0.0,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35.0))),
    backgroundColor: DarkThemeColors.titleColor,
    onPressed: onPressed,
    child: favorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
  );
}
