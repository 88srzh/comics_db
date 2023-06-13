// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_floating_action_button.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/cast_and_crew.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/peoples_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/recommendations/recommendations_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

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
    var cubit = context.watch<MovieDetailsCubit>();
    final favorite = cubit.state.isFavorite;

    return Scaffold(
      appBar: const CustomDetailsAppBar(title: ''),
      floatingActionButton: fab(() => cubit.toggleFavoriteMovie(context), favorite),
      body: ListView(
        children: [
          Column(
            children: const [
              MovieTopPosterWidget(),
              PeoplesWidget(),
              DescriptionWidget(),

              // TODO doesn't work, the request contains an invalid parameter value, need microtask?
              // TrailerWidget(youtubeKey: trailerKey),

              CastWidget(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 180,
                  child: MovieDetailsRecommendations(),
                ),
              ),
              // const MovieSimilarWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
