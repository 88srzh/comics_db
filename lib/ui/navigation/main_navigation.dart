import 'package:comics_db_app/domain/factoryes/screen_factory.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:comics_db_app/ui/widgets/splashscreen/splashscreen_model.dart';
import 'package:comics_db_app/ui/widgets/splashscreen/splashscreen_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_popular/tv_popular_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_trailer/tv_trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/upcoming_movie/upcoming_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class MainNavigationRouteNames {
  static const splashScreen = 'splashscreen';

  // TODO: may be move to start loaderWidget
  static const loaderWidget = '/';
  static const auth = '/auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
  static const fullCastAndCrew = '/main_screen/movie_details/fullCastAndCrew';
  static const tv = '/tv';
  static const tvDetails = '/main_screen/tv_details';
  static const tvTrailer = '/main_screen/tv_details/trailer';
  static const tvPopular = '/main_screen/tvPopular';
  static const news = '/news';
  static const trending = 'trending';
  static const popularMovie = '/main_screen/popularMovie';
  static const networkConnectionError = '/errors/network_connection';
  static const movieTrailer = '/main_screen/movie_details/trailer';
  static const topRatedMovie = '/main_screen/topRatedMovie';
  static const upcomingMovie = '/main_screen/upcomingMovie';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.auth: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
    MainNavigationRouteNames.splashScreen: (context) =>
        ChangeNotifierProvider(
            create: (_) => SplashscreenModel(),
            child: const SplashscreenWidget()),
    // MainNavigationRouteNames.popularMovie: (context) => ChangeNotifierProvider(
    //     create: (context) => MoviePopularListViewModel(),
    //     child: const MoviePopularListWidget()),
    MainNavigationRouteNames.tvPopular: (context) => const PopularTvWidget(),
    MainNavigationRouteNames.tv: (context) => const TvWidget(),
    // MainNavigationRouteNames.upcomingMovie: (_) =>
    //     _screenFactory.makeUpcomingMovieList(),
    MainNavigationRouteNames.upcomingMovie: (context) =>
        ChangeNotifierProvider(
          create: (_) => UpcomingMovieModel(), child: const MovieWidget(),
        ),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeMovieDetails(movieId),
        );
      case MainNavigationRouteNames.movieTrailer:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeMovieTrailer(youtubeKey),
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
      case MainNavigationRouteNames.tvTrailer:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (context) => TvTrailerWidget(tvYoutubeKey: youtubeKey),
        );
      default:
        const widget = Text('Ошибка навигации');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.loaderWidget, (route) => false);
  }
}
