import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_top_rated/top_rated_movie_model.dart';
import 'package:comics_db_app/ui/widgets/news/news_list_widget.dart';
import 'package:comics_db_app/ui/widgets/settings/settings_model.dart';
import 'package:comics_db_app/ui/widgets/settings/settings_widget.dart';
import 'package:comics_db_app/ui/widgets/trending/trending_all_model.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_model.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_widget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;
  final movieListModel = MovieListModel();
  final topRatedMovieModel = MovieListModel();
  // final topRatedMovieModel = TopRatedMovieModel();
  final tvListModel = TvListModel();
  final trendingAllModel = TrendingAllModel();
  final settingsModel = SettingsModel();

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    movieListModel.setupLocale(context);
    trendingAllModel.setupPage(context);
    tvListModel.setupLocale(context);
    settingsModel.setupLocale(context);
    topRatedMovieModel.setupTopRatedMovieLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    // просто получение модели без цели
    // final model = NotifierProvider.read<MainScreenModel>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Обзор'),
      // ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          // TODO: need to add newsListWidget model may be
          NotifierProvider(create: () => movieListModel, child: const NewsListWidget(), isManagingModel: false),
          NotifierProvider(create: () => topRatedMovieModel, child: const MovieListWidget()),
          // NotifierProvider(create: () => tvListModel, child: const TVListWidget()),
          ChangeNotifierProvider(create: (context) => tvListModel, child: const TvListWidget()),

          NotifierProvider(create: () => settingsModel, child: const SettingsWidget()),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColors.bottomBarBackgroundColor,
        initialActiveIndex: 1,
        items: const [
          TabItem<dynamic>(icon: Icons.home, title: 'Новости'),
          TabItem<dynamic>(icon: Icons.movie, title: 'Фильмы'),
          TabItem<dynamic>(icon: Icons.tv, title: 'Сериалы'),
          TabItem<dynamic>(icon: Icons.settings, title: 'Настройки'),
        ],
        onTap: (int index) => setState(() {
    _selectedTab = index;
    }),
   // onTap: onSelectTab,
      ),
    );
  }
}
