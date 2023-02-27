import 'package:comics_db_app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  const AppThemes._();

  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.openSansTextTheme(),
      primarySwatch: Colors.red,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white70,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(
          color: AppColors.kPrimaryColor,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white54,
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.openSansTextTheme(),
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.kPrimaryColor,
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
