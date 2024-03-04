import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_keywords_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsKeywordsWidget extends StatelessWidget {
  const MovieDetailsKeywordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    var keywordData = cubit.data.keywordsData;
    // final String keywords = cubit.state.keywords.first.name;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Keywords', style: Theme.of(context).textTheme.titleMedium),
          _MovieKeywordWidget(cubit: cubit, keywordData: keywordData),
        ],
      ),
    );
  }
}

class _MovieKeywordWidget extends StatelessWidget {
  final List<MovieDetailsKeywordsData> keywordData;

  const _MovieKeywordWidget({
    required this.cubit,
    required this.keywordData,
  });

  final MovieDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: keywordData.length,
        itemBuilder: (BuildContext context, int index) {
          return _MovieKeywordTextWidget(index: index);
        },
      ),
    );
  }
}

class _MovieKeywordTextWidget extends StatelessWidget {
  final int index;

  const _MovieKeywordTextWidget({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    final keywordData = cubit.data.keywordsData[index];
    final String keyword = keywordData.name;
    final int id = keywordData.id;
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.movieKeyword, arguments: id),
          child: Text(keyword, style: Theme.of(context).textTheme.labelSmall),
        ),
      ],
    );
  }
}
