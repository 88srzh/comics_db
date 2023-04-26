// Flutter imports:
import 'package:comics_db_app/ui/widgets/tv_details/components/cast_and_crew_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/title_genres_rating_voteAverage_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Widget fab(VoidCallback onPressed) {
      return FloatingActionButton(
        elevation: 0.0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35.0))),
        backgroundColor: Colors.pinkAccent,
        onPressed: onPressed,
        child: favorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
      );
    }
    // var tvTrailerData =
    //     context.select((TvDetailsModel model) => model.tvData.tvTrailedData);
    // final tvTrailerKey = tvTrailerData.trailerKey;

    return Scaffold(
      appBar: const CustomDetailsAppBar(title: 'Tv Details'),
      floatingActionButton: fab(() => cubit.toggleFavoriteTv(context)),
      body: ListView(
        children: [
          Column(
            children: const [
              TvTopPosterWidget(),
              TitleGenresRatingVoteAverageWidget(),
              TvDescriptionWidget(),
              // TvTrailerWidget(youtubeKey: tvTrailerKey),
              // const _DirectorWidget(),
              TvCastWidget(),
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
