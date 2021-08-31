import 'package:comics_db_app/widgets/news/components/news_widget_latest.dart';
import 'package:comics_db_app/widgets/news/components/news_widget_popular.dart';
import 'package:comics_db_app/widgets/news/components/news_widget_trending.dart';
import 'package:flutter/material.dart';

class NewsListWidget extends StatefulWidget {
  const NewsListWidget({Key? key}) : super(key: key);

  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsWidgetLatest(),
        NewsWidgetPopular(),
        NewsWidgetTrending(),
      // const NewsWidgetTopRated(),
      ],
    );
  }
}