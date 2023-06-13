// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/recommendations/recommendations_cubit.dart';

class MovieDetailsRecommendations extends StatefulWidget {
  const MovieDetailsRecommendations({Key? key}) : super(key: key);

  @override
  State<MovieDetailsRecommendations> createState() => _MovieDetailsRecommendationsState();
}

class _MovieDetailsRecommendationsState extends State<MovieDetailsRecommendations> {
  @override
  void didChangeDependencies() {
  super.didChangeDependencies();
  final locale = Localizations.localeOf(context);
  context.read<MovieDetailsRecommendationsCubit>().setupMovieDetailsRecommendations(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieDetailsRecommendationsCubit>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cubit.state.movies.length,
      itemBuilder: (BuildContext context, int index) {
        cubit.showedMovieDetailsRecommendationsAtIndex(index);
        final movie = cubit.state.movies[index];
        final posterPath = movie.posterPath;
        return Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Container(
            width: 220,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0),),
            ),
            child: InkWell(
              onTap: () {},
              child: posterPath != null ? Image.network(ImageDownloader.imageUrl(posterPath)) : const SizedBox
                  .shrink(),
            ),
          ),
        );
      },
    );
  }
}
