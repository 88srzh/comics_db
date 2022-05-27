import 'package:comics_db_app/ui/widgets/auth/auth_model.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_widget_simple.dart';
import 'package:comics_db_app/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:comics_db_app/ui/widgets/loader_widget/loader_widget.dart';
import 'package:comics_db_app/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:comics_db_app/ui/widgets/movie_popular_list/movie_popular_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      child: const LoaderWidget(),
      lazy: false,
    );
  }

  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthWidget(),
    );
  }

  Widget makeMainScreen() {
    return ChangeNotifierProvider(
      create: (_) => MovieListViewModel(),
      child: const MainScreenWidget(),
    );
  }

  Widget makeMovieDetails(int movieId) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailsModel(movieId),
      child: const MovieDetailsWidget(),
    );
  }

  Widget makeMovieTrailer(String youtubeKey) {
    return TrailerWidget(youtubeKey: youtubeKey);
  }

  Widget makePopularMovieList() {
    return ChangeNotifierProvider(
      create: (_) => MovieListViewModel(),
      // child: const PopularMovieWidgetProvider(),
      child: const MoviePopularListWidget(),
    );
  }
}
