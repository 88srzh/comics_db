import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopPosterWidget extends StatelessWidget {
  const TopPosterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MovieDetailsModel>(context, listen: true);
    final posterPath = model.movieDetails?.posterPath;
    final backdropPath = model.movieDetails?.backdropPath;
    return Stack(
      children: [
        Positioned(
          // TODO: backdropPath изображение поверх posterPath исправить
          child: AspectRatio(
            aspectRatio: 390 / 220,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.dstATop,
              ),
              child: backdropPath != null
                  ? Image.network(ImageDownloader.imageUrl(backdropPath))
                  // : const SizedBox.shrink(),
              : Image.asset(AppImages.noImageBig),
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                // TODO: почему-то не закругляет края
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                height: 212.0,
                width: 174.0,
                child: posterPath != null
                    ? Image.network(ImageDownloader.imageUrl(posterPath))
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_sharp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}