import 'package:comics_db_app/core/app_style.dart';
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/core/light_theme_colors.dart';
import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  const AppThemes._();

  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: LightThemeColors.backgroundColor,
      useMaterial3: true,
      primarySwatch: Colors.red,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(color: DarkThemeColors.kPrimaryColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white54,
      ),
      textTheme: const TextTheme(
        titleMedium: titleStyle,
        displaySmall: h4style,
        displayMedium: h3style,
        displayLarge: h1style,
        headlineSmall: h5italicStyle,
        headlineMedium: h5style,
        labelMedium: h5subtitleBoldStyle,
        labelSmall: h5subtitleSemiBoldStyle,
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: DarkThemeColors.kPrimaryColor,
      useMaterial3: true,
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: DarkThemeColors.kPrimaryColor,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: DarkThemeColors.bottomBarBackgroundColor,
        unselectedItemColor: DarkThemeColors.bottomBarIconColor,
      ),
      textTheme: TextTheme(
        titleMedium: titleStyle.copyWith(color: Colors.white),
        displaySmall: h4style.copyWith(color: Colors.white),
        displayMedium: h3style.copyWith(color: Colors.white),
        displayLarge: h1style.copyWith(color: Colors.white),
        headlineSmall: h5italicStyle.copyWith(color: Colors.white),
        headlineMedium: h5style.copyWith(color: Colors.white),
        labelMedium: h5subtitleBoldStyle.copyWith(color: Colors.white),
        labelSmall: h5subtitleSemiBoldStyle.copyWith(color: Colors.white),
      ),
    ),
  };
}
