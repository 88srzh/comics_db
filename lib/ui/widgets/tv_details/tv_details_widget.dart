import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/cast_and_crew_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/title_genres_rating_voteAverage_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvDetailsWidget extends StatefulWidget {
  const TvDetailsWidget({Key? key}) : super(key: key);

  @override
  _TvDetailsWidgetState createState() => _TvDetailsWidgetState();
}

class _TvDetailsWidgetState extends State<TvDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(
      () => context.read<TvDetailsModel>().setupLocale(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((TvDetailsModel model) => model.tvData.isLoading);
    if (isLoading) {
      return const Center(child: LoadingIndicatorWidget());
    }
    var tvTrailerData = context.select((TvDetailsModel model) => model.tvData.tvTrailedData);
    final tvTrailerKey = tvTrailerData.trailerKey;

    return Scaffold(
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: ListView(
          children: [
            Column(
              children: [
                const TvTopPosterWidget(),
                const TitleGenresRatingVoteAverageWidget(),
                const TvDescriptionWidget(),
                TvTrailerWidget(youtubeKey: tvTrailerKey),
                // const _DirectorWidget(),
                const TvCastWidget(),
              ],
            ),
          ],
        ),
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
//       child: const Text('?? ??????????????????', style: TextStyle(fontSize: 24)),
//       style: ButtonStyle(
//         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//         backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryColorOld),
//         padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 65.0, vertical: 15.0),),
//       ),
//     );
//   }
// }
