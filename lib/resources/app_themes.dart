import 'package:comics_db_app/core/app_colors.dart';
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/core/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  const AppThemes._();

  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: LightThemeColors.backgroundColor,
      canvasColor: Colors.white70,
      useMaterial3: true,
      textTheme: GoogleFonts.openSansTextTheme(),
      primarySwatch: Colors.red,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white70,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(
          color: DarkThemeColors.kPrimaryColor,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white54,
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: DarkThemeColors.kPrimaryColor,
      useMaterial3: true,
      textTheme: GoogleFonts.openSansTextTheme(),
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkThemeColors.kPrimaryColor,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.bottomBarBackgroundColor,
        unselectedItemColor: AppColors.bottomBarIconColor,
      ),
    ),
  };
}
