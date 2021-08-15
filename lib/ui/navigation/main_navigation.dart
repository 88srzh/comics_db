import 'package:comics_db_app/widgets/auth/auth_model.dart';
import 'package:comics_db_app/widgets/auth/auth_widget.dart';
import 'package:comics_db_app/widgets/main_screen/main_screen.dart';
import 'package:comics_db_app/widgets/movie_details/movie_details_widget.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteNames {
  static const auth = '/auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.mainScreen
      : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    '/auth': (context) =>
        AuthProvider(model: AuthModel(), child: const AuthWidget()),
    '/main_screen': (context) => const MainScreenWidget(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
            builder: (context) => MovieDetailsWidget(movieId: movieId));
      default:
        const widget = Text('Ошибка навигации');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
