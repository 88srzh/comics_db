// Flutter imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_behavior.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // TODO: нужно отказаться от mainNavigation
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: CustomBehavior(),
                child: child!,
              );
            },
            theme: state.theme,
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
      ),
    );
  }
}
