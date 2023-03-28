// Flutter imports:
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/cast_and_crew.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/peoples_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/top_poster_widget.dart';
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

    final locale =  Localizations.localeOf(context);
    context.read<MovieDetailsCubit>().setupMovieDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    // var cubit = context.watch<MovieDetailsCubit>().data;
    // final trailerKey = cubit.trailerKey;
    // final List<Movie> movieList = context.watch<MoviePopularListBloc>().state.movieContainer.movies;

    // Widget fab(VoidCallback onPressed) {
    //   return FloatingActionButton(
    //     elevation: 0.0,
    //     backgroundColor: LightThemeColor.accent,
        // onPressed: onPressed,
        // child: movieList[movieList.getIndex(movie)].isFavorite
        //     ? const Icon(Icons.heart_broken)
        //     : const Icon(Icons.heart_broken_outlined),
      // );
    // }

    return Scaffold(
      appBar: const CustomDetailsAppBar(title: 'Movie Details'),
      // floatingActionButton: fab(
      //   () => context
      //       .read<MoviePopularListBloc>()
      //       .add(MovieListEventFaforiteItemEvent(movie: movieList[movieList.getIndex(movie)])),
      // ),
      body: ListView(
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
    );
  }
}
