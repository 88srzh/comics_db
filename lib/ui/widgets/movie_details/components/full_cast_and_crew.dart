import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FullCastAndCrewWidget extends StatelessWidget {
  const FullCastAndCrewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailsModel>();
    var cast = model.movieDetails?.credits.cast;
    if (cast == null || cast.isEmpty) return const SizedBox.shrink();
      return SizedBox(
        height: 250,
        child: ListView.builder(
              itemCount: ,
            ),
            itemCount: cast.length,
            itemBuilder: (BuildContext context, int index) {
              return _ActorListItemWidget(actorIndex: index);
            },
        ),
    );
  }
}

class _ActorListItemWidget extends StatelessWidget {
  final int actorIndex;

  const _ActorListItemWidget({Key? key, required this.actorIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailsModel>();
    final actor = model.movieDetails?.credits.cast[actorIndex];
    final backdropPath = actor?.profilePath;
    return ListView(
      children: [
        backdropPath != null
            ? Image.network(ImageDownloader.imageUrl(backdropPath))
            : const Image(image: AssetImage(AppImages.noImage)),

      ],
    );
  }
}

