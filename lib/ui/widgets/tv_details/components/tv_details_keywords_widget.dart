import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvDetailsKeywordsWidget extends StatelessWidget {
  final String keywords;
  const TvDetailsKeywordsWidget({super.key, required this.keywords});

  @override
  Widget build(BuildContext context) {
    var keywordsList = context.read<TvDetailsCubit>().state.keywords;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
