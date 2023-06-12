// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_floating_action_button.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/cast_and_crew_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/title_genres_rating_voteAverage_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/top_poster_widget.dart';
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

    // TODO remove to separate file
    // var tvTrailerData =
    //     context.select((TvDetailsModel model) => model.tvData.tvTrailedData);
    // final tvTrailerKey = tvTrailerData.trailerKey;

    return Scaffold(
      appBar: const CustomDetailsAppBar(title: ''),
      floatingActionButton: fab(() => cubit.toggleFavoriteTv(context), favorite),
      body: ListView(
        children: [
          Column(
            children: const [
              TvTopPosterWidget(),
              TitleGenresRatingVoteAverageWidget(),
              TvDescriptionWidget(),
              // TvTrailerWidget(youtubeKey: tvTrailerKey),
              // const _DirectorWidget(),
              TVCastWidget(),
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
