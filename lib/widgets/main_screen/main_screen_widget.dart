import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/widgets/movie_list/movie_list_model.dart';
import 'package:comics_db_app/widgets/movie_list/movie_list_widget.dart';
import 'package:comics_db_app/widgets/news/news_list_widget.dart';
import 'package:comics_db_app/widgets/trending/trending_all_model.dart';
import 'package:comics_db_app/widgets/tv_list/tv_list_model.dart';
import 'package:comics_db_app/widgets/tv_list/tv_list_widget.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;
  final movieListModel = MovieListModel();
  final tvListModel = TVListModel();
  final trendingAllModel = TrendingAllModel();

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
  }

  @override
  Widget build(BuildContext context) {
    // просто получение модели без цели
    // final model = NotifierProvider.read<MainScreenModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Обзор'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          // TODO: need to add newsListWidget model may be
          NotifierProvider(create: () => movieListModel, child: const NewsListWidget(), isManagingModel: false),
          NotifierProvider(create: () => movieListModel, child: const MovieListWidget()),
          NotifierProvider(create: () => tvListModel, child: const TVListWidget()),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedTab,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedTab = index;
        }),
        items: [
          BottomNavyBarItem(icon: const Icon(Icons.home), title: const Text('Новости'), activeColor: AppColors.kPrimaryColor),
          BottomNavyBarItem(icon: const Icon(Icons.movie), title: const Text('Фильмы'), activeColor: AppColors.kPrimaryColor),
          BottomNavyBarItem(icon: const Icon(Icons.tv), title: const Text('Сериалы'), activeColor: AppColors.kPrimaryColor),
        ],
        // onTap: onSelectTab,
      ),
    );
  }
}
