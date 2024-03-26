// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class MovieDetailsKeywordsWidget extends StatelessWidget {
  final String keywords;

  const MovieDetailsKeywordsWidget({super.key, required this.keywords});

  @override
  Widget build(BuildContext context) {
    var keywordsList = context.read<MovieDetailsCubit>().state.keywords;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(keywords, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          Text(keywordsList, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
