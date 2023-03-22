// Flutter imports:
import 'package:comics_db_app/core/app_extension.dart';
import 'package:comics_db_app/domain/blocs/movie/movie_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/cast_and_crew.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/peoples_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/top_poster_widget.dart';
import 'package:provider/provider.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // var cubit = context.watch<MovieDetailsCubit>().data;
    // final trailerKey = cubit.trailerKey;
    final List<Movie> movieList = context.watch<MoviePopularListBloc>().state.movieContainer.movies;

    Widget fab(VoidCallback onPressed) {
      return FloatingActionButton(
        elevation: 0.0,
        // backgroundColor: LightThemeColor.accent,
        onPressed: onPressed,
        child: movieList[movieList.getIndex(movie)].isFavorite
            ? const Icon(Icons.heart_broken)
            : const Icon(Icons.heart_broken_outlined),
      );
    }

    return Scaffold(
      appBar: const CustomDetailsAppBar(title: 'Movie Details'),
      floatingActionButton: fab(
        () => context
            .read<MoviePopularListBloc>()
            .add(MovieListEventFaforiteItemEvent(movie: movieList[movieList.getIndex(movie)])),
      ),
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
