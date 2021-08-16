import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:flutter/material.dart';

class NewsListWidget extends StatefulWidget {
  const NewsListWidget({Key? key}) : super(key: key);

  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => SessionDataProvider().setSessionId(null),
            child: const Text('Logout'),
            ),
            ],
      ),
    );
  }
}