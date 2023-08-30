// Flutter imports:
import 'package:comics_db_app/ui/components/custom_rate_floating_action_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_favorite_floating_action_button.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/cast_and_crew_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/title_genres_rating_vote_average_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_recommendations_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';

class TvDetailsWidget extends StatefulWidget {
  const TvDetailsWidget({Key? key}) : super(key: key);

  @override
  State<TvDetailsWidget> createState() => _TvDetailsWidgetState();
}

class _TvDetailsWidgetState extends State<TvDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<TvDetailsCubit>().setupTvDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    // final isLoading =
    //     context.select((TvDetailsModel model) => model.tvData.isLoading);
    // if (isLoading) {
    //   return const Center(child: LoadingIndicatorWidget());
    // }
    var cubit = context.watch<TvDetailsCubit>();
    final favorite = cubit.state.isFavorite;
    final watchlist = cubit.state.isWatchlist;

    return Scaffold(
      appBar: const CustomDetailsAppBar(title: ''),
      floatingActionButton: Wrap(
        direction: Axis.horizontal,
        children: [
          fabWatchlist(() => cubit.toggleWatchlistTV(context), watchlist),
          const SizedBox(width: 10.0),
          fabFavorite(() => cubit.toggleFavoriteTv(context), favorite),
        ],
      ),
      body: ListView(
        children: const [
          Column(
            children: [
              TvTopPosterWidget(),
              TitleGenresRatingVoteAverageWidget(),
              TvDescriptionWidget(),
              // const _DirectorWidget(),
              TVCastWidget(),
              TvDetailsRecommendationsWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

// class _FavoritesButton extends StatelessWidget {
//   const _FavoritesButton({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {},
//       child: const Text('В Избранное', style: TextStyle(fontSize: 24)),
//       style: ButtonStyle(
//         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//         backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryColorOld),
//         padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 65.0, vertical: 15.0),),
//       ),
//     );
//   }
// }
