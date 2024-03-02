import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsKeywordsWidget extends StatelessWidget {
  const MovieDetailsKeywordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String keywords = context.read<MovieDetailsCubit>().state.keywords.first.name;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Keywords', style: Theme.of(context).textTheme.titleMedium),
          Text(keywords, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
