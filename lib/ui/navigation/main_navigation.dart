// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/domain/factories/screen_factory.dart';
import 'package:comics_db_app/ui/widgets/tv_trailer/tv_trailer_widget.dart';

abstract class MainNavigationRouteNames {
  static const splashScreen = 'splashscreen';

  // TODO: may be move to start loaderWidget
  static const loaderWidget = '/';
  static const auth = '/auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
  static const movieKeyword = '/main_screen/movie_keyword';
  static const popularMovie = '/main_screen/popularMovie';
  static const nowPlayingMovie = '/main_screen/nowPlayingMovie';
  static const topRatedMovie = '/main_screen/topRatedMovie';
  static const upcomingMovie = '/main_screen/upcomingMovie';
  static const fullCastAndCrew = '/main_screen/movie_details/fullCastAndCrew';
  static const movieTrailer = '/main_screen/movie_details/trailer';
  static const trending = '/main_screen/trending';
  static const trendingThisWeek = '/main_screen/trending/this_week';
  static const favoriteMovies = '/main_screen/favorite_movies';
  static const watchlistMovie = '/main_screen/watchlistMovie';
  static const watchlistTV = '/main_screen/watchlistTV';
  static const tvDetails = '/main_screen/tv_details';
  static const tvTrailer = '/main_screen/tv_details/trailer';
  static const tvDetailsFullListOfSeasons = '/main_screen/tv_details/full_list_of_seasons';
  static const tvTopRated = '/main_screen/tv_top_rated';
  static const tvPopularList = '/main_screen/tvPopular';
  static const tvAiringToday = '/main_screen/tvAiringToday';
  static const favoriteTvs = '/main_screen/favorite_tvs';
  static const peopleDetails = '/main_screen/peopleDetails';
  static const movieDetailsFullCastAndCrewList = '/main_screen/movie_details/full_cast_and_crew';
  static const movieDetailsFullReviewsList = '/main_screen/movie_details/full_reviews';
  static const peopleDetailsKnownForList = '/main_screen/people_details/full_known_for';
  static const settings = '/personal_widget';
  static const networkConnectionError = '/errors/network_connection';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.auth: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
    MainNavigationRouteNames.popularMovie: (_) => _screenFactory.makePopularMovieList(),
    MainNavigationRouteNames.nowPlayingMovie: (_) => _screenFactory.makeNowPlayingMovieList(),
    MainNavigationRouteNames.tvTopRated: (_) => _screenFactory.makeTvTopRatedList(),
    MainNavigationRouteNames.tvPopularList: (_) => _screenFactory.makePopularTvList(),
    MainNavigationRouteNames.tvAiringToday: (_) => _screenFactory.makeAiringTodayTvList(),
    MainNavigationRouteNames.favoriteTvs: (_) => _screenFactory.makeFavoriteTvList(),
    MainNavigationRouteNames.favoriteMovies: (_) => _screenFactory.makeFavoriteMovieList(),
    MainNavigationRouteNames.watchlistMovie: (_) => _screenFactory.makeWatchlistMovie(),
    MainNavigationRouteNames.watchlistTV: (_) => _screenFactory.makeWatchlistTV(),
    // MainNavigationRouteNames.tvDetailsFullListOfSeasons: (_) => _screenFactory.tvDetailsFullListOfSeasons(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeMovieDetails(movieId),
        );
      case MainNavigationRouteNames.movieDetailsFullCastAndCrewList:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeFullCastAndCrewList(movieId),
        );
      case MainNavigationRouteNames.movieDetailsFullReviewsList:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeFullReviewsList(movieId),
        );
      case MainNavigationRouteNames.movieKeyword:
        final arguments = settings.arguments;
        final keywordId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeMovieKeywordList(keywordId),
        );
      case MainNavigationRouteNames.peopleDetailsKnownForList:
        final arguments = settings.arguments;
        final peopleId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makePeopleDetailsKnownForList(peopleId),
        );
      case MainNavigationRouteNames.movieTrailer:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeMovieTrailer(youtubeKey),
        );
      case MainNavigationRouteNames.peopleDetails:
        final arguments = settings.arguments;
        final peopleId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makePeopleDetails(peopleId),
        );
      // TODO: refactoring tv
      case MainNavigationRouteNames.tvDetails:
        final arguments = settings.arguments;
        final tvId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeTvDetails(tvId),
        );
      // case MainNavigationRouteNames.tvDetailsFullListOfSeasons;
      // final arguments = settings.arguments;
      // final tvId = arguments is int ? arguments : 0;
      // return MaterialPageRoute(builder: (_) => _screenFactory.tvDetailsFullListOfSeasons);

      case MainNavigationRouteNames.tvTrailer:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (context) => TvDetailsTrailerWidget(tvYoutubeKey: youtubeKey),
        );
      default:
        const widget = Text('Navigation error ');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(MainNavigationRouteNames.loaderWidget, (route) => false);
  }
}
