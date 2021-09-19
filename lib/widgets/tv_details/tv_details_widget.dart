import 'dart:ui';

import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';

class TVDetailsWidget extends StatefulWidget {
  const TVDetailsWidget({Key? key}) : super(key: key);

  @override
  _TVDetailsWidgetState createState() => _TVDetailsWidgetState();
}

class _TVDetailsWidgetState extends State<TVDetailsWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    NotifierProvider.read<TVDetailsModel>(context)?.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TVDetailsModel>(context);
    final tvDetails = model?.tvDetails;
    if (tvDetails == null) {
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
                    children: const [
                      _TitleAndRatingWidget(),
                      SizedBox(height: 5.0,),
                      _DirectorWidget(),
                      SizedBox(height: 25.0),
                      _GenresWidget(),
                      _DescriptionWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const _TopPosterWidget(),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 56.0, vertical: 10.0),
        child: _FavoritesButton(),
      ),
    );
  }
}

class _FavoritesButton extends StatelessWidget {
  const _FavoritesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('В Избранное', style: TextStyle(fontSize: 24)),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
        backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryColor),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 65.0, vertical: 15.0),),
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
    final model = NotifierProvider.watch<TVDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Text(model.tvDetails?.overview ?? 'Загрузка описания...',
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
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
    final model = NotifierProvider.watch<TVDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    var texts = <String>[];
    // возможно нужно поменять на нул модел
    final genres = model.tvDetails?.genres;
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
              texts.join(' '),
              style: const TextStyle(color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class _DirectorWidget extends StatelessWidget {
  const _DirectorWidget({
    Key? key,
  }) : super(key: key);

    @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TVDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    var names = <String>[];
    final createdBy = model.tvDetails?.createdBy;
    if (createdBy != null && createdBy.isNotEmpty) {
      var createdByNames = <String>[];
      for (var create in createdBy) {
        createdByNames.add(create.name);
      }
      names.add(createdByNames.join(', '));
    }


    return Row(
      children: [
        const Text('Режиссер: ', style: TextStyle(color: Colors.grey),),
        Text(names.join(' ')),
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
    final model = NotifierProvider.watch<TVDetailsModel>(context);
    var rating = model?.tvDetails?.voteAverage.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          model?.tvDetails?.name ?? 'Название',
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            const Icon(Icons.star_border_outlined, size: 20),
            const SizedBox(width: 5.0,),
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
    final model = NotifierProvider.watch<TVDetailsModel>(context);
    var posterPath = model?.tvDetails?.posterPath;
    var backdropPath = model?.tvDetails?.backdropPath;
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
            child: posterPath != null ? Image.network(ApiClient.imageUrl(posterPath)) : const Center(child: CircularProgressIndicator()),
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
    final model = NotifierProvider.watch<TVDetailsModel>(context);
    return Center(child: Text(model?.tvDetails?.name ?? 'Загрузка...', style: const TextStyle(color: Colors.black)));
  }
}

