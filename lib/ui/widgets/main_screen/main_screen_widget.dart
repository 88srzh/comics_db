import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/blocs/popular_movie_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/now_playing_movie_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/top_rated_movie_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/upcoming_movie_list_bloc.dart';
import 'package:comics_db_app/domain/factories/screen_factory.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_now_playing_list/now_playing_movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_top_rated/top_rated_movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/personal/personal_widget.dart';
import 'package:comics_db_app/ui/widgets/settings/settings_model.dart';
import 'package:comics_db_app/ui/widgets/trending/trending_all_model.dart';
import 'package:comics_db_app/ui/widgets/tv_airing_today/tv_airing_today_model.dart';
import 'package:comics_db_app/ui/widgets/tv_popular/tv_popular_model.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_top_rated/tv_top_rated_model.dart';
import 'package:comics_db_app/ui/widgets/upcoming_movie/upcoming_movie_cubit.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;
  final _screenFactory = ScreenFactory();

  final tvPopularModel = TvPopularModel();
  final tvTopRatedModel = TvTopRatedModel();
  final airingTodayModel = AiringTodayTvsModel();
  final trendingAllModel = TrendingAllModel();
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
    //
    tvTopRatedModel.setupLocale(context);
    tvPopularModel.setupLocale(context);
    airingTodayModel.setupLocale(context);
    trendingAllModel.setupPage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: [
          _screenFactory.makePopularMovieList(),
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => TopRatedMovieListCubit(topRatedMovieListBloc: TopRatedMovieListBloc(MovieListState.initial()))),
              BlocProvider(create: (_) => MovieListCubit(movieListBloc: MovieListBloc(MovieListState.initial()))),
              BlocProvider(create: (_) => UpcomingMovieListCubit(upcomingMovieListBloc: UpcomingMovieListBloc(MovieListState.initial()))),
              BlocProvider(create: (_) => NowPlayingMovieListCubit(nowPlayingMovieListBloc: NowPlayingMovieListBloc(MovieListState.initial()))),
            ],
            child: const MovieListWidget(),
          ),
          MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => tvTopRatedModel),
              ChangeNotifierProvider(create: (_) => tvPopularModel),
              ChangeNotifierProvider(create: (_) => airingTodayModel),
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
          TabItem<dynamic>(icon: Icons.home, title: 'News'),
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
