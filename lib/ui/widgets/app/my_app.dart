// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_behavior.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // TODO: нужно отказаться от mainNavigation
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ModelTheme(),
        child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                return ScrollConfiguration(
                  behavior: CustomBehavior(),
                  child: child!,
                );
              },
              theme: themeNotifier.isDark
                  ? ThemeData(
                      useMaterial3: true,
                      textTheme: GoogleFonts.signikaNegativeTextTheme(),
                      primarySwatch: Colors.blue,
                      appBarTheme: const AppBarTheme(
                        backgroundColor: AppColors.kPrimaryColor,
                        scrolledUnderElevation: 0.0,
                      ),
                      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                        selectedItemColor: AppColors.bottomBarBackgroundColor,
                        unselectedItemColor: AppColors.bottomBarIconColor,
                      ),
                    )
                  : ThemeData(
                useMaterial3: true,
                textTheme: GoogleFonts.signikaNegativeTextTheme(),
                primarySwatch: Colors.red,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.pink,
                  scrolledUnderElevation: 0.0,
                ),
              ),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ru', 'RU'),
                Locale('en', ''),
              ],
              routes: mainNavigation.routes,
              initialRoute: MainNavigationRouteNames.loaderWidget,
              onGenerateRoute: mainNavigation.onGenerateRoute,
            );
          },
        ));
  }
}
