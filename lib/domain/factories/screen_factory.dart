import 'package:comics_db_app/domain/blocs/auth_bloc.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_model.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_widget_simple.dart';
import 'package:comics_db_app/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:comics_db_app/ui/widgets/loader_widget/loader_widget.dart';
import 'package:comics_db_app/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/top_rated_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/popular_movie_list_model.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing_list/movie_now_playing_list_model.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing_list/movie_now_playing_list_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_popular_list/movie_popular_list_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_top_rated/top_rated_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  AuthBloc? _authBloc;

  Widget makeLoader() {
    final authBloc = _authBloc ?? AuthBloc(AuthCheckStatusInProgressState());
    _authBloc = authBloc;
    return BlocProvider<LoaderViewCubit>(
      // create: (context) => LoaderViewModel(context),
      create: (context) => LoaderViewCubit(LoaderViewCubitState.unknown, authBloc),
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

// TODO: may be delete provider
  Widget makeMainScreen() {
    _authBloc?.close();
    _authBloc = null;
    return const MainScreenWidget();
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

  Widget makeTopRatedMovieList() {
    return ChangeNotifierProvider(
      create: (_) => TopRatedMovieViewModel(),
      child: const TopRatedMovieWidget(),
    );
  }

  Widget makeNowPlayingMovieList() {
    return ChangeNotifierProvider(
      create: (_) => NowPlayingMovieListModel(),
      child: const MovieNowPlayingListWidget(),
    );
  }

  Widget makeUpcomingMovieList() {
    return ChangeNotifierProvider(
      create: (_) => NowPlayingMovieListModel(),
      child: const MovieNowPlayingListWidget(),
    );
  }
}
