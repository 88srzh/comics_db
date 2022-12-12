import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_list_state.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/now_playing_movie_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/top_rated_movie_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_airing_today_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_on_the_air_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_state.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_top_rated_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/movie/upcoming_movie_list_bloc.dart';
import 'package:comics_db_app/domain/factories/screen_factory.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing_list/now_playing_movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_top_rated/top_rated_movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/personal/personal_widget.dart';
import 'package:comics_db_app/ui/widgets/settings/settings_model.dart';
import 'package:comics_db_app/ui/widgets/tv_airing_today/tv_airing_today_cubit.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_popular_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/tv_on_the_air/tv_on_the_air_cubit.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_top_rated/tv_top_rated_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/upcoming_movie_list/upcoming_movie_cubit.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;
  final _screenFactory = ScreenFactory();

  final settingsModel = SettingsModel();

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(
      () {
        _selectedTab = index;
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: [
          _screenFactory.makePopularPeopleList(),
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => TopRatedMovieListCubit(topRatedMovieListBloc: TopRatedMovieListBloc(MovieListState.initial()))),
              BlocProvider(create: (_) => MoviePopularListCubit(movieListBloc: MoviePopularListBloc(MovieListState.initial()))),
              BlocProvider(create: (_) => UpcomingMovieListCubit(upcomingMovieListBloc: UpcomingMovieListBloc(MovieListState.initial()))),
              BlocProvider(create: (_) => NowPlayingMovieListCubit(nowPlayingMovieListBloc: NowPlayingMovieListBloc(MovieListState.initial()))),
            ],
            child: const MovieListWidget(),
          ),
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => TvPopularListCubit(tvPopularListBloc: TvPopularListBloc(TvListState.initial()))),
              BlocProvider(create: (_) => TvAiringTodayListCubit(tvAiringTodayListBloc: TvAiringTodayListBloc(TvListState.initial()))),
              BlocProvider(create: (_) => TvTopRatedListCubit(tvTopRatedListBloc: TvTopRatedListBloc(TvListState.initial()))),
              BlocProvider(create: (_) => TvOnTheAirListCubit(tvOnTheAirListBloc: TvOnTheAirListBloc(TvListState.initial()))),
            ],
            child: const TvListWidget(),
          ),
          ChangeNotifierProvider(
            // TODO: model need only for hand over widget
            create: (_) => settingsModel,
            child: const PersonalWidget(),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColors.bottomBarBackgroundColor,
        initialActiveIndex: 1,
        items: const [
          TabItem<dynamic>(icon: Icons.people, title: 'People'),
          TabItem<dynamic>(icon: Icons.movie, title: 'Movie'),
          TabItem<dynamic>(icon: Icons.tv, title: 'TV'),
          TabItem<dynamic>(icon: Icons.settings, title: 'Personal'),
        ],
        onTap: (int index) => setState(
          () {
            _selectedTab = index;
          },
        ),
      ),
    );
  }
}
