import 'package:comics_db_app/domain/entity/movie_details.dart';
import 'package:comics_db_app/domain/entity/movie_details_credits.dart';
import 'package:comics_db_app/domain/entity/movie_details_external_ids.dart';
import 'package:comics_db_app/domain/entity/movie_details_keywords.dart';
import 'package:comics_db_app/domain/entity/movie_details_recommendations.dart';
import 'package:comics_db_app/domain/entity/movie_details_reviews.dart';
import 'package:comics_db_app/domain/entity/movie_details_similar.dart';
import 'package:comics_db_app/domain/entity/movie_details_videos.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_keywords_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comics_db_app/generated/l10n.dart';

class MovieDetailsKeywordsWidget extends StatelessWidget {
  const MovieDetailsKeywordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    var keywordData = cubit.data.keywordsData;
    // final String keywords = cubit.state.keywords.first.name;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 200.0,
        width: 300.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(S.of(context).keywords, style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            _MovieKeywordWidget(cubit: cubit, keywordData: keywordData),
          ],
        ),
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
    final details = MovieDetails(
      adult: false,
      backdropPath: '',
      budget: 0,
      genres: [],
      homepage: '',
      id: 0,
      imdbId: '',
      originalLanguage: '',
      originalTitle: '',
      overview: '',
      popularity: 0,
      posterPath: '',
      productionCompanies: [],
      productionCountries: [],
      releaseDate: DateTime(0),
      revenue: 0,
      runtime: 0,
      spokenLanguages: <SpokenLanguage>[],
      status: '',
      tagline: '',
      title: '',
      video: false,
      voteAverage: 0,
      voteCount: 0,
      credits: MovieDetailsCredits(cast: [], crew: []),
      videos: MovieDetailsVideos(results: []),
      recommendations: const MovieDetailsRecommendations(page: 0, recommendationsResults: []),
      similar: MovieDetailsSimilar(similar: []),
      externalIds: MovieDetailsExternalIDs(),
      reviews: const MovieDetailsReviews(result: []),
      keywords: const MovieDetailsKeywords(keywords: []),
    );
    final stringList = makeKeywords(details);
    return Text(stringList, style: Theme.of(context).textTheme.labelSmall);
  }

  String makeKeywords(MovieDetails details) {
    var texts = <String>[];
    if (details.keywords.keywords.isNotEmpty) {
      var keywordsNames = <String>[];
      for (var keyword in details.keywords.keywords) {
        keywordsNames.add(keyword.name);
      }
      texts.add(keywordsNames.join(', '));
    }
    return texts.join(', ');
  }
}

/* class _MovieKeywordTextWidget extends StatelessWidget {
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
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.movieKeyword, arguments: id),
          child: Text(keyword, style: Theme.of(context).textTheme.labelSmall),
        ),
      ],
    );
  }
}
 */
