import 'dart:ui';

import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_title_genres_rating_voteaverage_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvDetailsWidget extends StatefulWidget {
  const TvDetailsWidget({Key? key}) : super(key: key);

  @override
  _TvDetailsWidgetState createState() => _TvDetailsWidgetState();
}

class _TvDetailsWidgetState extends State<TvDetailsWidget> {

  // TODO: возможно добавить проверку на session expired

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // NotifierProvider.read<TvDetailsModel>(context)?.setupLocale(context);
    Provider.of<TvDetailsModel>(context, listen: false).setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    final tvDetailsModel = Provider.of<TvDetailsModel>(context).tvDetails;
    if (tvDetailsModel == null) {
      return const Center(child: LoadingIndicatorWidget());
    }
    final tvVideos = tvDetailsModel.videos.results
        .where((video) => video.type == "Trailer" && video.site == 'YouTube');
    final tvTrailerKey = tvVideos.isNotEmpty == true ? tvVideos.first.key : null;
    var voteAverage = tvDetailsModel.voteAverage;
    voteAverage = voteAverage * 10;
    String youtubeKey = tvTrailerKey.toString();
    // final tvDetails = NotifierProvider.watch<TvDetailsModel>(context)?.tvDetails;
    // final videos = tvDetails?.videos.results
    //     .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    // final tvTrailerKey = videos?.isNotEmpty == true ? videos?.first.key : null;
    // var voteAverage = tvDetails?.voteAverage ?? 0;
    // voteAverage = voteAverage * 10;
    // if (tvDetails == null) {
      // return const Center(child: CircularProgressIndicator(),);
    //   return const LoadingIndicatorWidget();
    // }


    return Scaffold(
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: ListView(
          children: [
            Column(
              children: const [
                TvTopPosterWidget(),
                TitleGenresRatingVoteAverageWidget(),
                // const TitleGenresRatingVoteAverageWidget(),
                // const DescriptionWidget(),
                // TrailerWidget(),
              ],
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: const _TitleWidget(),
      //   shadowColor: Colors.transparent,
      //   backgroundColor: Colors.grey[100],
      // ),
      // body: ListView(
      //   scrollDirection: Axis.vertical,
      //   shrinkWrap: true,
      //   children: [
      //     Stack(
      //     clipBehavior: Clip.hardEdge,
      //     // fit: StackFit.passthrough,
      //     children: [
      //       Container(
      //         color: Colors.white,
      //         child: Column(
      //           children: [
      //             SizedBox(
      //               height: 180,
      //               child: Container(
      //                 color: Colors.grey[100],
      //               ),
      //             ),
      //             SizedBox(
      //               height: 150,
      //               child: Container(
      //                 color: Colors.white,
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 26.0),
      //               child: Column(
      //                 children: const [
      //                   _TitleAndRatingWidget(),
      //                   SizedBox(height: 5.0,),
      //                   _DirectorWidget(),
      //                   SizedBox(height: 15.0),
      //                   _GenresWidget(),
      //                   _DescriptionWidget(),
      //                   SizedBox(height: 5.0,),
      //                   _CastWidget(),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       const _TopPosterWidget(),
      //       tvTrailerKey != null ? Positioned(
      //         top: 220,
      //         right: 70,
      //         child: IconButton(
      //           onPressed: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.tvTrailer, arguments: tvTrailerKey),
      //           icon: const Icon(MdiIcons.motionPlayOutline, size: 60),
      //         ),
      //       ) : const SizedBox.shrink(),
      //       Positioned(
      //         top: 60,
      //           right: 45,
      //           child: SizedBox(
      //             width: 65,
      //             height: 65,
      //             child: RadialPercentWidget(
      //               percent: voteAverage / 100,
      //               child: Text(voteAverage.toStringAsFixed(0) + '%', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      //                 fillColor: Colors.white,
      //                 lineColor: Colors.black,
      //                 freeColor: Colors.grey,
      //                 lineWidth: 5.0,
      //                 ),
      //             ),
      //           ),
      //     ],
      //   ),
      // ],
      // ),
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
        backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryColorOld),
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
    final model = NotifierProvider.watch<TvDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Text(model.tvDetails?.overview ?? 'Загрузка описания...',
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
    final model = NotifierProvider.watch<TvDetailsModel>(context);
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
            color: const Color.fromRGBO(246, 246, 246, 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            texts.join(' '),
            style: const TextStyle(color: Colors.grey),
            maxLines: 3,
            // overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _DirectorWidget extends StatelessWidget {
  const _DirectorWidget({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvDetailsModel>(context);
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
        Expanded(
          child: Text(names.join(' '), style: const TextStyle(color: Colors.black87),),
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
    final model = NotifierProvider.watch<TvDetailsModel>(context);
    var rating = model?.tvDetails?.voteAverage.toString();
    // var date = model?.tvDetails?.firstAirDate.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  model?.tvDetails?.name ?? 'Название',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () => model?.toggleFavoriteTV(),
                icon: Icon(model?.isFavoriteTV == true ? Icons.favorite : Icons.favorite_border, size: 20)),
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
    final model = NotifierProvider.watch<TvDetailsModel>(context);
    var posterPath = model?.tvDetails?.posterPath;
    // var backdropPath = model?.tvDetails?.backdropPath;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
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
        ),
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvDetailsModel>(context);
    return Center(
        child: Text(model?.tvDetails?.name?? 'Загрузка...', style: const TextStyle(color: Colors.black)));
  }
}

class _CastWidget extends StatelessWidget {
  const _CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Актеры'),
          ),
          const SizedBox(
            height: 250.0,
            child: Scrollbar(
                child: _TvActorListWidget()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                // onTap: () {
                //   showDialog<void>(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return Dialog(
                //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                //           elevation: 16,
                //           child: Container(
                //             height: 400,
                //             width: 360,
                //             child: ListView.builder(
                //               itemCount: 6,
                //                 itemExtent: 120,
                //                 scrollDirection: Axis.horizontal,
                //                 itemBuilder: (BuildContext context, int index) {
                //                 return _TvActorListItemWidget(actorIndex: index);
                //                 }),
                //           ),
                //         );
                //       });
                // },
              onTap: () {},
                child: const Text('Полный актерский состав')),
          ),
        ],
      ),
    );
  }
}

class _TvActorListWidget extends StatelessWidget {
  const _TvActorListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvDetailsModel>(context);
    var cast = model?.tvDetails?.credits.cast;
    if (cast == null || cast.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
        itemCount: 6,
        itemExtent: 120,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _TvActorListItemWidget(actorIndex: index);
        });
  }
}

class _TvActorListItemWidget extends StatelessWidget {
  final int actorIndex;
  const _TvActorListItemWidget({Key? key, required this.actorIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<TvDetailsModel>(context);
    final actor = model!.tvDetails?.credits.cast[actorIndex];
    final backdropPath = actor?.profilePath;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              backdropPath != null
                  ? Image.network(ApiClient.imageUrl(backdropPath))
              // : const SizedBox.shrink(),
                  : const Image(image: AssetImage(AppImages.noImage)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(actor!.name, maxLines: 1),
                      const SizedBox(height: 7),
                      Text(actor.character, maxLines: 2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}