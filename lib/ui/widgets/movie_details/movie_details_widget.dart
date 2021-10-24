import 'dart:ui';

import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/movie_details_credits.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/app/my_app_model.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';

class MovieDetailsWidget extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final movieDetails = model?.movieDetails;
    if (movieDetails == null) {
      return const Center(child: CircularProgressIndicator(),);
    }
    return Scaffold(
      appBar: AppBar(
        // пропадает стрелочка
        // automaticallyImplyLeading: false,
        title: const _TitleAppBarWidget(),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.grey[100],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Stack(
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
                        _TitleAndYearWidget(),
                        SizedBox(height: 5.0,),
                        _TrailerAndRatingWidget(),
                        SizedBox(height: 5.0),
                        _DirectorWidget(),
                        SizedBox(height: 5.0),
                       _YearWidget(),
                        SizedBox(height: 5.0),
                       _GenresWidget(),
                       _DescriptionWidget(),
                       _PeoplesWidget(),
                       _CastWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const _TopPosterWidget(),
            Positioned(
              top: 40,
              right: 60,
              child: IconButton(
                iconSize: 30,
                icon: Icon(model?.isFavoriteMovie == true ? Icons.favorite : Icons.favorite_border),
                onPressed: () => model?.toggleFavoriteMovie(),
              ),
            ),
          ],
        ),
      ],
      ),
      // bottomNavigationBar: const _FavoritesButton(),
    );
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
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
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

class _TrailerAndRatingWidget extends StatefulWidget {
     const _TrailerAndRatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_TrailerAndRatingWidget> createState() => _TrailerAndRatingWidgetState();
}

class _TrailerAndRatingWidgetState extends State<_TrailerAndRatingWidget> {
  // late final YoutubePlayerController _controller;

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
    // _controller = YoutubePlayerController(
    //   initialVideoId: trailerKeyNew,
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: true,
    //   ),
    // );
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          trailerKey != null ? Row(
          children: [
            const Icon(Icons.play_arrow),
            InkWell(
              // лучше вынести в модель или еще куда-нибудь
              onTap: () => Navigator.of(context).pushNamed(
                  MainNavigationRouteNames.movieTrailer, arguments: trailerKey),
              // onTap: () => _trailerDialog,
              child: const Text('Трейлер'),
            ),
          ],
        ) : const SizedBox.shrink(),
      ],
    );
  }
}

class _DirectorWidget extends StatelessWidget {
  const _DirectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Row(

    );
  }
}


class _TitleAndYearWidget extends StatelessWidget {
  const _TitleAndYearWidget({
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
        Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                model?.movieDetails?.title ?? 'Загрузка названия...',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
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
    // var backdropPath = model?.movieDetails?.backdropPath;
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
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
        ),
        Positioned(
          top: 20,
          right: 20,
          child: IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
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
              child: Text('Series Cast'),
            ),
            const SizedBox(
              height: 250.0,
              child: Scrollbar(
                child: _ActorListWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                  // onTap: () async => showFullCastAndCrew(context),
                  child: const Text('Full cast & crew')),
            ),
          ],
        ),
    );
  }

  // Future<dynamic> showFullCastAndCrew(BuildContext context) {
  //   final int actorIndex;
  //   final model = NotifierProvider.read<MovieDetailsModel>(context);
  //   final actor = model!.movieDetails?.credits.cast[actorIndex];
  //   final backdropPath = actor?.profilePath;
  //   return showDialog<void>(
  //       context: context,
  //       builder: (context) => Scaffold(
  //         backgroundColor: Colors.transparent,
  //         body: Builder(
  //             builder: (context) => AlertDialog(
  //               content: Container(
  //                 height: 600,
  //                 width: 400,
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(20)
  //                 ),
  //                 child: GridView.builder(
  //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
  //                   keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
  //                   padding: const EdgeInsets.all(10),
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return _ActorListItemWidget(actorIndex: index);
  //                   },
  //                 ),
  //               ),
  //             )),
  //       ));
  //
  // }
}

class _ActorListWidget extends StatelessWidget {
  const _ActorListWidget({Key? key}) : super(key: key);

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
        return _ActorListItemWidget(actorIndex: index);
      });
  }
}

class _ActorListItemWidget extends StatelessWidget {
  final int actorIndex;
  const _ActorListItemWidget({Key? key, required this.actorIndex}) : super(key: key);

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





