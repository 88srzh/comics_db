import 'package:flutter/material.dart';

class MovieDetailsKeywordsWidget extends StatelessWidget {
  const MovieDetailsKeywordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          Text('Keywords', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
