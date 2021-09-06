import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/widgets/main_screen/main_screen_model.dart';
import 'package:comics_db_app/widgets/movie_list/movie_list_model.dart';
import 'package:comics_db_app/widgets/movie_list/movie_list_widget.dart';
import 'package:comics_db_app/widgets/trending/news_widget_trending.dart';
import 'package:comics_db_app/widgets/news/components/news_widget_popular.dart';
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
  int _selectedTab = 0;
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
          NotifierProvider(
            model: movieListModel, child: const NewsWidgetPopular()),
          NotifierProvider(
            model: trendingAllModel, child: const NewsWidgetTrending()),
          NotifierProvider(
              model: movieListModel, child: const MovieListWidget()),
          NotifierProvider
          (model: tvListModel, child: const TVListWidget()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Новости'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Фильмы'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Сериалы')
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
