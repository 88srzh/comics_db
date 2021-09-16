import 'dart:ui';

import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    NotifierProvider.read<MovieDetailsModel>(context)?.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final movieDetails = model?.movieDetails;
    if (movieDetails == null) {
      return const Center(child: CircularProgressIndicator(),);
    }
    return Scaffold(
      appBar: AppBar(
        title: const _TitleWidget(),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.grey[100],
      ),
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Container(
                    color: Colors.grey[100],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Column(
                    children: [
                      const _TitleAndRatingWidget(),
                      const SizedBox(height: 5.0,),
                      const _DirectorAndTrailerWidget(),
                      const SizedBox(height: 35.0),
                      const _GenresWidget(),
                      const _DescriptionWidget(),
                     ElevatedButton(
                       onPressed: () {},
                       child: const Text('В Избранное', style: TextStyle(fontSize: 24)),
                       style: ButtonStyle(
                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                         backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryColor),
                         padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 85.0, vertical: 15.0),),
                       ),
                       ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const _TopPosterWidget(),
        ],
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Text(model?.movieDetails?.overview ?? 'Загрузка описания...',
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GenresWidget extends StatelessWidget {
  const _GenresWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    var texts = <String>[];
    final genres = model?.movieDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genre in genres) {
        genresNames.add(genre.name);
      }
      texts.add(genresNames.join(', '));
    }
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246,246,246, 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            child: Text(
              texts.join(' '), style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

class _DirectorAndTrailerWidget extends StatelessWidget {
  const _DirectorAndTrailerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            const Icon(Icons.play_arrow),
            const Text('Трейлер'),
          ],
         ),
      ],
    );
  }
}

class _TitleAndRatingWidget extends StatelessWidget {
  const _TitleAndRatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var rating = model?.movieDetails?.voteAverage.toString();
    var year = model?.movieDetails?.releaseDate?.year.toString();
    year = year != null ? ' ($year)' : 'нету года';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              // TODO не влезает название фильма
              model?.movieDetails?.title ?? 'Загрузка названия...',
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(year, style: const TextStyle(
              fontSize: 18),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.star_border_outlined, size: 20),
            const SizedBox(width: 5.0),
            Text(rating ?? '0.0', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
          ],
        ),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var posterPath = model?.movieDetails?.posterPath;
    var backdropPath = model?.movieDetails?.backdropPath;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: SizedBox(
            height: 295.0,
            width: 210.0,
            child: posterPath != null ? Image.network(ApiClient.imageUrl(posterPath)) : const SizedBox.shrink(),
            ),
          ),
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    // TODO не по центру название
    return Center(child: Text(model?.movieDetails?.title ?? 'Загрузка...', style: const TextStyle(color: Colors.black)));
  }
}

