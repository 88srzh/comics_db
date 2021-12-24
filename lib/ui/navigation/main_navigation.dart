import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_model.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_widget.dart';
import 'package:comics_db_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:comics_db_app/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_popular_list/movie_popular_list_widget.dart';
import 'package:comics_db_app/ui/widgets/splashscreen/splashscreen_model.dart';
import 'package:comics_db_app/ui/widgets/splashscreen/splashscreen_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_popular/tv_popular_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_trailer/tv_trailer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class MainNavigationRouteNames {
  static const splashScreen = 'splashscreen';
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
  static const fullCastAndCrew = '/movie_details/fullCastAndCrew';
  static const tv = '/tv';
  static const tvDetails = '/tv_details';
  static const tvTrailer = '/tv_details/trailer';
  static const tvPopular = '/tvPopular';
  static const news = '/news';
  static const trending = 'trending';
  static const popularMovie = '/popularMovie';
  static const networkConnectionError = '/errors/network_connection';
  static const movieTrailer = '/movie_details/trailer';
  static const topRatedMovie = '/topRatedMovie';
  static const upcomingMovie = '/upcomingMovie';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      // ? MainNavigationRouteNames.splashScreen
      ? MainNavigationRouteNames.mainScreen
      : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    'auth': (context) => NotifierProvider(create: () => AuthModel(), child: const AuthWidget()),
    MainNavigationRouteNames.splashScreen: (context) => ChangeNotifierProvider(create: (_) => SplashscreenModel(), child: const SplashscreenWidget()),
    MainNavigationRouteNames.mainScreen: (context) => ChangeNotifierProvider(create: (_) => MainScreenModel(), child: const MainScreenWidget()),
    // MainNavigationRouteNames.popularMovie: (context) => NotifierProvider(create: () => MovieListModel(), child: const MovieListWidget()),
    // MainNavigationRouteNames.popularMovie: (context) => ChangeNotifierProvider(create: (_) => MoviePopularListModel(), child: const MoviePopularListWidget()),
    MainNavigationRouteNames.popularMovie: (context) => const MoviePopularWidget(),
    MainNavigationRouteNames.tvPopular: (context) => const PopularTvWidget(),
    // MainNavigationRouteNames.topRatedMovie: (context) => NotifierProvider(create: () => MoviePopularListModel(), child: const MovieListWidget()),
    MainNavigationRouteNames.tv: (context) => const TvWidget(),
    MainNavigationRouteNames.upcomingMovie: (context) => const MovieWidget(),
    // MainNavigationRouteNames.popularMovieList: (context) => NotifierProvider(create: () => MoviePopularListModel(), child: const MoviePopularListWidget(),),
    // '/trending': (context) => NotifierProvider(model: TrendingAllModel(), child: const NewsWidgetTrending()),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => MovieDetailsModel(movieId),
              child: const MovieDetailsWidget(),
            ),
        );
      case MainNavigationRouteNames.tvDetails:
        final arguments = settings.arguments;
        final tvId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => TvDetailsModel(tvId),
            child: const TvDetailsWidget(),
          ),
        );
      case MainNavigationRouteNames.movieTrailer:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (context) => TrailerWidget(youtubeKey: youtubeKey),
        );
      case MainNavigationRouteNames.tvTrailer:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
            builder: (context) => TvTrailerWidget(tvYoutubeKey: youtubeKey));
      default:
        const widget = Text('Ошибка навигации');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}