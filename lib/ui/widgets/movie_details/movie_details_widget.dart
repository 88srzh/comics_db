// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/cast_and_crew.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/peoples_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:provider/provider.dart';

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
    // var cubit = context.watch<MovieDetailsCubit>().data;
    // final trailerKey = cubit.trailerKey;

    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Scaffold(
          appBar: const CustomDetailsAppBar(title: 'Movie Details'),
          body: ColoredBox(
            color: notifierTheme.isDark ? AppColors.kPrimaryColor : Colors.transparent,
            child: ListView(
              children: [
                Column(
                  children: const [
                    MovieTopPosterWidget(),
                    PeoplesWidget(),
                    DescriptionWidget(),

                    // TODO doesn't work, the request contains an invalid parameter value, need microtask
                    // TrailerWidget(youtubeKey: trailerKey),

                    CastWidget(),
                    // const MovieSimilarWidget(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
