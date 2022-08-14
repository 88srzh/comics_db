import 'package:comics_db_app/domain/api_client/account_api_client.dart';
import 'package:comics_db_app/domain/blocs/auth_bloc.dart';
import 'package:comics_db_app/domain/blocs/auth_view_cubit_state.dart';
import 'package:comics_db_app/domain/blocs/movie_details_bloc.dart';
import 'package:comics_db_app/domain/blocs/movie_details_new_bloc.dart';
import 'package:comics_db_app/domain/blocs/movie_list_bloc.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_view_cubit.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_widget_simple.dart';
import 'package:comics_db_app/ui/widgets/loader_widget/loader_view_cubit.dart';
import 'package:comics_db_app/ui/widgets/loader_widget/loader_widget.dart';
import 'package:comics_db_app/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
<<<<<<< HEAD
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
=======
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_new_cubit.dart';
>>>>>>> main
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/top_rated_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit.dart';
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
      create: (_) => LoaderViewCubit(LoaderViewCubitState.unknown, authBloc),
      child: const LoaderWidget(),
    );
  }

  Widget makeAuth() {
    final authBloc = _authBloc ?? AuthBloc(AuthCheckStatusInProgressState());
    _authBloc = authBloc;
    return BlocProvider<AuthViewCubit>(
      create: (_) => AuthViewCubit(AuthViewCubitFormFillInProgressState(), authBloc),
      child: const AuthWidget(),
    );
    // return ChangeNotifierProvider(
    //   create: (_) => AuthViewModel(),
    //   child: const AuthWidget(),
    // );
  }

// TODO: may be delete provider
  Widget makeMainScreen() {
    _authBloc?.close();
    _authBloc = null;
    return const MainScreenWidget();
  }

  Widget makePopularMovieList() {
    return BlocProvider(
      create: (_) => MovieListCubit(
        movieListBloc: MovieListBloc(
          MovieListState.initial(),
        ),
      ),
      child: const MoviePopularListWidget(),
    );
  }

  Widget makeMovieDetails(int movieId) {
    // TODO: should fix
    return BlocProvider(
<<<<<<< HEAD
      create: (_) => MovieDetailsCubit(movieId),
=======
      create: (_) => MovieDetailsNewCubit(movieId),
>>>>>>> main
      child: const MovieDetailsWidget(),
    );

    // return ChangeNotifierProvider(
    // create: (_) => MovieListCubit(
    //   movieListBloc: MovieListBloc(
    //     MovieListState.initial(),
    //   ),
    // create: (_) => MovieDetailsModel(movieId),
    // child: const MovieDetailsWidget(),
    // );
  }

  Widget makeMovieTrailer(String youtubeKey) {
    return TrailerWidget(youtubeKey: youtubeKey);
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
