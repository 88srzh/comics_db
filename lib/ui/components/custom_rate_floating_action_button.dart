import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:flutter/material.dart';

FloatingActionButton fabWatchlist(VoidCallback onPressed, bool rate) {
  return FloatingActionButton(
    heroTag: 'watchlist',
    elevation: 0.0,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35.0))),
    backgroundColor: DarkThemeColors.titleColor,
    onPressed: onPressed,
    child: rate ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_outline),
  );
}
