import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsCollectionWidget extends StatelessWidget {
  const MovieDetailsCollectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieDetailsCubit>();
    var collectionData = context.watch<MovieDetailsCubit>().state.collection;
    if (collectionData == null) return const SizedBox.shrink();
    final String? backdropPath = cubit.data.collectionData.first.backdropPath;
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 390 / 220,
        child: CachedNetworkImage(
          imageUrl: ImageDownloader.imageUrl(backdropPath!),
          placeholder: (context, url) => const LoadingIndicatorWidget(),
          errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
        ),
      ),
    );
  }
}
