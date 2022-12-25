import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/cast_and_crew.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/peoples_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<MovieDetailsCubit>().setupMovieDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieDetailsCubit>().data;
    final trailerKey = cubit.trailerKey;

    return Scaffold(
      appBar: const CustomDetailsAppBar(title: 'Movie Details'),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: ListView(
          children: [
            Column(
              children: [
                const MovieTopPosterWidget(),
                const PeoplesWidget(),
                const DescriptionWidget(),

                // TODO doesn't work, the request contains an invalid parameter value, need microtask
                TrailerWidget(youtubeKey: trailerKey),

                const CastWidget(),
                // const MovieSimilarWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
