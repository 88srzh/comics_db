// Flutter imports:
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';

class MovieDetailsRecommendations extends StatelessWidget {
  const MovieDetailsRecommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieDetailsCubit>();
    var recommendationsData = cubit.data.recommendationsData;
    if (recommendationsData.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        final recommendations = cubit.data.recommendationsData[index];
        // var recommendationsId = recommendations.id;
        final posterPath = recommendations.posterPath;
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
