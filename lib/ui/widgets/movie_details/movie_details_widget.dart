// Flutter imports:
import 'package:comics_db_app/ui/components/custom_rate_floating_action_button.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_keywords_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_other_information_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_reviews_widget.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_favorite_floating_action_button.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_cast_and_crew_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/peoples_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_recommendations_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({super.key});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  late Future<String> lazyValue;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future<String> loadingDelay() {
      Duration duration = const Duration(seconds: 2);

      return Future.delayed(duration, () => 'It took ${duration.inSeconds}');
    }

    lazyValue = loadingDelay();

    final locale = Localizations.localeOf(context);
    context.read<MovieDetailsCubit>().setupMovieDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieDetailsCubit>();
    final favorite = cubit.state.isFavorite;
    final watchlist = cubit.state.isWatchlist;

    return FutureBuilder(
      future: lazyValue,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: const CustomDetailsAppBar(title: ''),
            floatingActionButton: Wrap(
              direction: Axis.horizontal,
              children: [
                fabWatchlist(() => cubit.toggleWatchlistMovie(context), watchlist),
                const SizedBox(width: 10.0),
                fabFavorite(() => cubit.toggleFavoriteMovie(context), favorite),
              ],
            ),
            body: ListView(
              children: const [
                Column(
                  children: [
                    MovieTopPosterWidget(),
                    PeoplesWidget(),
                    MovieDetailsDescriptionWidget(),
                    MovieDetailsCastWidget(),
                    // MovieDetailsAllVideosWidget(),
                    MovieDetailsReviewsWidget(),
                    MovieDetailsRecommendations(),
                    MovieDetailsOtherInformationWidget(),
                    MovieDetailsKeywordsWidget(),
                    // const MovieDetailsSimilarWidget(),
                    // const MovieSimilarWidget(),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
