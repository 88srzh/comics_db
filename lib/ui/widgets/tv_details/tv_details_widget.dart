// Flutter imports:
import 'package:comics_db_app/generated/l10n.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/director_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_other_information_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_top_poster_widget.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_favorite_floating_action_button.dart';
import 'package:comics_db_app/ui/components/custom_rate_floating_action_button.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_cast_and_crew_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_description_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_title_genres_rating_vote_average_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_recommendations_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';

class TvDetailsWidget extends StatefulWidget {
  const TvDetailsWidget({super.key});

  @override
  State<TvDetailsWidget> createState() => _TvDetailsWidgetState();
}

class _TvDetailsWidgetState extends State<TvDetailsWidget> {
  late Future<String> lazyValue;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future<String> loadingDelay() {
      Duration duration = const Duration(seconds: 1);

      return Future.delayed(duration, () => 'It took ${duration.inSeconds}');
    }

    lazyValue = loadingDelay();

    final locale = Localizations.localeOf(context);
    context.read<TvDetailsCubit>().setupTvDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<TvDetailsCubit>();
    final favorite = cubit.state.isFavorite;
    final watchlist = cubit.state.isWatchlist;

    return FutureBuilder(
      future: lazyValue,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: CustomAppBar(
              onTapRu: () => setState(() {
                S.load(const Locale('ru'));
              }),
              onTapEn: () => setState(() {
                S.load(const Locale('en'));
              }),
            ),
            floatingActionButton: Wrap(
              direction: Axis.horizontal,
              children: [
                fabWatchlist(() => cubit.toggleWatchlistTV(context), watchlist),
                const SizedBox(width: 10.0),
                fabFavorite(() => cubit.toggleFavoriteTv(context), favorite),
              ],
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    const TvDetailsTopPosterWidget(),
                    const TvDetailsTitleGenresRatingVoteAverageWidget(),
                    TvDetailsDirectorWidget(creator: S.of(context).creator),
                    TvDetailsDescriptionWidget(overviewTitle: S.of(context).overview),
                    TvDetailsCastWidget(seriesCast: S.of(context).seriesCast),
                    TvDetailsRecommendationsWidget(recommendations: S.of(context).recommendations),
                    TvDetailsOtherInformationWidget(statusText: S.of(context).status),
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
