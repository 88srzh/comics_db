import 'dart:ui';

import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/movie_details_credits.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/app/my_app_model.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsWidget extends StatefulWidget {
  // final String youtubeKey;
  const MovieDetailsWidget({Key? key}) : super(key: key);


  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void initState() {
    super.initState();
    final model = NotifierProvider.read<MovieDetailsModel>(context);
    final appModel = Provider.read<MyAppModel>(context);
    model?.onSessionExpired = () => appModel?.resetSession(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    NotifierProvider.read<MovieDetailsModel>(context)?.setupLocale(context);
  }

  late final YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final movieDetails = model?.movieDetails;
    if (movieDetails == null) {
      return const Center(child: CircularProgressIndicator(),);
    }
    final videos = movieDetails.videos.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos.isNotEmpty  == true ? videos.first.key : null;

    _controller = YoutubePlayerController(
      initialVideoId: trailerKey ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    return Scaffold(
      body: ColoredBox(
        color: AppColors.kPrimaryColorNew,
        child: ListView(
          children: [
            Column(
            children: [
              const _TopPosterWidget(),
              const _TitleGenresRatingVoteAverageWidget(),
              const _DescriptionWidget(),
        Column(
          children: [
            const Text('Трейлер',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 21,
                color: AppColors.genresText,

              ),
            ),
            trailerKey != null ?
            YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
                builder: (context, player) {
                  return Column(
                    children: [
                      player,
                    ],
                  );
                }
            ) : const SizedBox.shrink(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //       trailerKey != null ? Row(
            //       children: [
            //         const Icon(Icons.play_arrow),
            //         InkWell(
            //           // лучше вынести в модель или еще куда-нибудь
            //           onTap: () => Navigator.of(context).pushNamed(
            //               MainNavigationRouteNames.movieTrailer, arguments: trailerKey),
            //           // onTap: () => _trailerDialog,
            //           child: const Text('Трейлер'),
            //         ),
            //       ],
            //     ) : const SizedBox.shrink(),
            //   ],
            // ),
          ],
        ),
              // const TrailerAndRatingWidget(youtubeKey: trail,),
                 ],
                ),
    ],
        ),
      ),
          );
      // bottomNavigationBar: const _FavoritesButton(),
  }
}


// class _FavoritesButton extends StatelessWidget {
//   const _FavoritesButton({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 10.0),
//       child: ElevatedButton(
//         onPressed: () {},
//         child: const Text('В Избранное', style: TextStyle(fontSize: 24)),
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//           backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryColor),
//           padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 65.0, vertical: 15.0),),
//         ),
//         ),
//     );
//   }
// }

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Описание',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              // TODO rename text
              color: AppColors.genresText,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                // Добавить расстояние между строками
                child: Text(model?.movieDetails?.overview ?? 'Загрузка описания...',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: const TextStyle(
                color: AppColors.genresText,
                fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _YearWidget extends StatelessWidget {
  const _YearWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var year = model?.movieDetails?.releaseDate?.year.toString();
    return Row(
      children: [
        const Text('Год: ', style: TextStyle(color: Colors.grey),),
        Text(year!, style: const TextStyle(color: Colors.grey),)
      ],
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
    final genres = model.movieDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genre in genres) {
        genresNames.add(genre.name);
      }
      texts.add(genresNames.join(', '));
    }
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(246,246,246, 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
              child: Text(
                texts.join(' '), style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TrailerAndRatingWidget extends StatefulWidget {
  final String youtubeKey;
     const TrailerAndRatingWidget({
       Key? key, required this.youtubeKey
  }) : super(key: key);

  @override
  State<TrailerAndRatingWidget> createState() => _TrailerAndRatingWidgetState();
}

class _TrailerAndRatingWidgetState extends State<TrailerAndRatingWidget> {
  late final YoutubePlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //
  //   _controller = YoutubePlayerController(
  //     initialVideoId: widget.youtubeKey,
  //     flags: const YoutubePlayerFlags(
  //       autoPlay: true,
  //       mute: true,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // final model = NotifierProvider.watch<MovieDetailsModel>(context);
    // if (model == null) return const SizedBox.shrink();
    final movieDetails = NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    final videos = movieDetails?.videos.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos?.isNotEmpty  == true ? videos?.first.key : null;
    // final trailerKeyNew = trailerKey.toString();
    // String trailerKeyString = trailerKey.toString();
    // TODO add rating
    // var rating = model.movieDetails?.voteAverage.toString();

    // TODO поменять контроллер в initstate, чтобы инициализировалось один раз при загрузке страницы
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    return Column(
      children: [
        const Text('Трейлер',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 21,
            color: AppColors.genresText,

          ),
        ),
        YoutubePlayerBuilder(
          player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
            ),
          builder: (context, player) {
             return Column(
              children: [
                player,
                    ],
                  );
                }
              ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //       trailerKey != null ? Row(
        //       children: [
        //         const Icon(Icons.play_arrow),
        //         InkWell(
        //           // лучше вынести в модель или еще куда-нибудь
        //           onTap: () => Navigator.of(context).pushNamed(
        //               MainNavigationRouteNames.movieTrailer, arguments: trailerKey),
        //           // onTap: () => _trailerDialog,
        //           child: const Text('Трейлер'),
        //         ),
        //       ],
        //     ) : const SizedBox.shrink(),
        //   ],
        // ),
      ],
    );
  }
}

// class _DirectorWidget extends StatelessWidget {
//   const _DirectorWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final model = NotifierProvider.watch<MovieDetailsModel>(context);
//     return Row(
//
//     );
//   }
// }


class _TitleGenresRatingVoteAverageWidget extends StatelessWidget {
  const _TitleGenresRatingVoteAverageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var rating = model?.movieDetails?.voteAverage.toString();
    var year = model?.movieDetails?.releaseDate?.year.toString();
    var voteAverage = model?.movieDetails?.voteAverage ?? 0;
    voteAverage = voteAverage * 10;

    // genres
    if (model == null) return const SizedBox.shrink();
    var texts = <String>[];
    final genres = model.movieDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genre in genres) {
        genresNames.add(genre.name);
      }
      texts.add(genresNames.join(', '));
    }
    // year = year != null ? ' ($year)' : 'нету года';
      return Center(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(model.movieDetails?.title ?? 'Загрузка названия...',
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: AppColors.titleText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              texts.join(' '),
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.genresText,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: AppColors.ratingStar, size: 14),
                const SizedBox(width: 2),
                Text(rating ?? '0.0',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.ratingText,
                  ),
                ),
                const Text(' / 10 от themoviedb',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.ratingText,
                  ),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.thumb_up_alt_outlined, color: AppColors.ratingThumb, size: 14),
                const SizedBox(width: 2),
                Text(voteAverage.toStringAsFixed(0) + '%',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.ratingText,
                  ),
                ),
                const Text('от пользователей',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.ratingText,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Это мне понадобится, когда буду добавлять ЖАНРЫ

        // child: Padding(
        //   padding: const EdgeInsets.only(top: 12.0),
        //   child: RichText(
        //     maxLines: 3,
        //     textAlign: TextAlign.center,
        //     text: TextSpan(
        //       children: [
        //         TextSpan(
        //           text: model?.movieDetails?.title ?? 'Загрузка названия...',
        //           style: const TextStyle(
        //             fontSize: 21,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //         TextSpan(
        //           text: year,
        //         ),
        //       ]
        //     ),
        //   ),
        // ),
      );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Expanded(
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Expanded(
    //           child: Text(
    //             model?.movieDetails?.title ?? 'Загрузка названия...',
    //             overflow: TextOverflow.ellipsis,
    //             maxLines: 2,
    //             style: const TextStyle(
    //                 fontSize: 20, fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //       ],
    //     ),
    //     ),
    //     Row(
    //       children: [
    //         const Icon(Icons.star_border_outlined, size: 20),
    //         const SizedBox(width: 5.0),
    //         Text(rating ?? '0.0', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
    //       ],
    //     ),
    //   ],
    // );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final posterPath = model?.movieDetails?.posterPath;
    final backdropPath = model?.movieDetails?.backdropPath;
    return Stack(
      children: [
        Positioned(
          child: AspectRatio(
            aspectRatio: 390 / 220,
            child: backdropPath != null ? Image.network(ApiClient.imageUrl(backdropPath)) : const SizedBox.shrink(),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: SizedBox(
              height: 212.0,
              width: 174.0,
              child: posterPath != null ? Image.network(ApiClient.imageUrl(posterPath)) : const SizedBox.shrink(),
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

class _TitleAppBarWidget extends StatelessWidget {
  const _TitleAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    // TODO не по центру название
    return Center(child: Text(model?.movieDetails?.title ?? 'Загрузка...', style: const TextStyle(color: Colors.black)));
  }
}

// TODO change font color to grey, may be do coloredbox
class _PeoplesWidget extends StatelessWidget {
  const _PeoplesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var crew = model?.movieDetails?.credits.crew;
    if (crew == null || crew.isEmpty) return const SizedBox.shrink();
    crew = crew.length > 4 ?  crew.sublist(0, 4) : crew;
    var crewChunks = <List<Employee>>[];
    for (var i = 0; i< crew.length; i += 2) {
      crewChunks.add(
        crew.sublist(i, i + 2 > crew.length ? crew.length : i +2)
      );
    }
    return Column(
      children: crewChunks.map((chunk) => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: _PeoplesWidgetRow(employes: chunk),
      ),).toList(),
      // children: [
      //   _PeoplesWidgetRow(employes: [],),
      //   const SizedBox(height: 20),
      //   _PeoplesWidgetRow(employes: [],),
      // ],

    );
  }
}

class _PeoplesWidgetRow extends StatelessWidget {
  final List<Employee> employes;

  const _PeoplesWidgetRow({Key? key, required this.employes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: employes.map((employee) => _PeopleWidgetRowItem(employee: employee)).toList(),
    );
  }
}

class _PeopleWidgetRowItem extends StatelessWidget {
  final Employee employee;
  const _PeopleWidgetRowItem({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(employee.name),
          Text(employee.job),
        ],
      ),
    );
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
                child: _MovieActorListWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                  // onTap: () async => showFullCastAndCrew(context),
                  child: const Text('Полный актерский состав')),
            ),
          ],
        ),
    );
  }
}

class _MovieActorListWidget extends StatelessWidget {
  const _MovieActorListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var cast = model?.movieDetails?.credits.cast;
    if (cast == null || cast.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: 6,
      itemExtent: 120,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _MovieActorListItemWidget(actorIndex: index);
      });
  }
}

class _MovieActorListItemWidget extends StatelessWidget {
  final int actorIndex;
  const _MovieActorListItemWidget({Key? key, required this.actorIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<MovieDetailsModel>(context);
    final actor = model!.movieDetails?.credits.cast[actorIndex];
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
              // TODO if image doesn't exist load 'no image'
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
                      // SizedBox(height: 7),
                      // Text('4 Episodes', maxLines: 1),
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





