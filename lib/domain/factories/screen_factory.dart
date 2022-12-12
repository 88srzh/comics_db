import 'package:comics_db_app/domain/blocs/auth/auth_bloc.dart';
import 'package:comics_db_app/domain/blocs/auth/auth_view_cubit_state.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_state.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/now_playing_movie_list_bloc.dart';
im'package:comics_db_app/domain/blocs/people/popular_people_list_bloc.dart'dart';
import 'package:comics_db_app/domain/blocs/tv/tv_airing_today_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_state.dart';
import 'package:comics_db_app/domain/blocs/movie/upcoming_movie_list_bloc.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_view_cubit.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_widget_simple.dart';
import 'package:comics_db_app/ui/widgets/loader_widget/loader_view_cubit.dart';
import 'package:comics_db_app/ui/widgets/loader_widget/loader_widget.dart';
import 'package:comics_db_app/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/top_rated_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/upcoming_movie_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing_list/movie_now_playing_list_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing_list/now_playing_movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_popular_list/movie_popular_list_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_widget.dart';
import 'package:comics_db_app/ui/widgets/people_widget/popular_people_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/people_widget/popular_people_list_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_airing_today/tv_airing_today_cubit.dart';
import 'package:comics_db_app/ui/widgets/tv_airing_today/tv_airing_today_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_popular_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/tv_popular/tv_popular_widget.dart';
import 'package:comics_db_app/ui/widgets/upcoming_movie_list/upcoming_movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  }

// TODO: may be delete provider
  Widget makeMainScreen() {
    _authBloc?.close();
    _authBloc = null;
    return const MainScreenWidget();
  }

  Widget makePopularPeopleList() {
    return BlocProvider(
      create: (_) => PeopleListCubit(
        peopleListBloc: PeopleListBloc(
          PeopleListState.initial(),
        ),
      ),
      child: const PopularPeopleListWidget(),
    );
  }

  Widget makePopularMovieList() {
    return BlocProvider(
      create: (_) => MoviePopularListCubit(
        movieListBloc: MoviePopularListBloc(
          MovieListState.initial(),
        ),
      ),
      child: const MoviePopularListWidget(),
    );
  }

  Widget makeMovieDetails(int movieId) {
    // TODO: should fix
    return BlocProvider(
      create: (_) => MovieDetailsCubit(movieId),
      child: const MovieDetailsWidget(),
    );
  }

  Widget makePeopleDetails(int id) {
    return BlocProvider(
      create: (_) => PeopleDetailsCubit(id),
      child: const PeopleDetailsWidget(),
    );
  }

  Widget makeMovieTrailer(String youtubeKey) {
    return TrailerWidget(youtubeKey: youtubeKey);
  }

  Widget makeTopRatedMovieList() {
    return BlocProvider(
      create: (_) => MoviePopularListCubit(
        movieListBloc: MoviePopularListBloc(
          MovieListState.initial(),
        ),
      ),
      child: const TopRatedMovieWidget(),
    );
  }

  Widget makeNowPlayingMovieList() {
    return BlocProvider(
      create: (_) => NowPlayingMovieListCubit(
        nowPlayingMovieListBloc: NowPlayingMovieListBloc(
          MovieListState.initial(),
        ),
      ),
      child: const MovieNowPlayingListWidget(),
    );
  }

  Widget makeUpcomingMovieList() {
    return BlocProvider(
      create: (_) => UpcomingMovieListCubit(
        upcomingMovieListBloc: UpcomingMovieListBloc(
          MovieListState.initial(),
        ),
      ),
      child: const UpcomingMovieWidget(),
    );
  }

  Widget makePopularTvList() {
    return BlocProvider(
      create: (_) => TvPopularListCubit(
        tvPopularListBloc: TvPopularListBloc(
          TvListState.initial(),
        ),
      ),
      child: const PopularTvWidget(),
    );
  }

  Widget makeTvAiringTodayList() {
    return BlocProvider(
      create: (_) => TvAiringTodayListCubit(
        tvAiringTodayListBloc: TvAiringTodayListBloc(
          TvListState.initial(),
        ),
      ),
      child: const AiringTodayTvsWidget(),
    );
  }
}
