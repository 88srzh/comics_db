import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:comics_db_app/ui/widgets/movie_top_rated/top_rated_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => MovieListModel(), child: const MovieListWidget());
}


class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    // final topRatedMovieModel = NotifierProvider.watch<MovieListModel>(context);
    final topRatedMovieModel = context.watch<MovieListModel>();
    if (topRatedMovieModel == null) return const SizedBox.shrink();
    // final model = NotifierProvider.watch<MovieListModel>(context);
    // if (model == null) return const SizedBox.shrink();
    return Scaffold (
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal:   8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.movieAppBarLogo)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // TODO оптимизировать значки
                  GestureDetector(
                    onTap: () {},
                      child: const Icon(Icons.search, color: AppColors.searchIcon, size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {},
                        child: const Icon(Icons.filter_alt_outlined, color: AppColors.ratingThumb, size: 30,),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                      child: const Icon(Icons.menu, color: AppColors.ratingThumb, size: 30,),
                  ),
                ],
              ),
            ],
          ),
        ),
        // actions: const [
        //   Icon(Icons.search, color: AppColors.searchIcon),
        //   // TODO поменять название цвета
        //   Icon(Icons.filter_alt_outlined, color: AppColors.ratingThumb),
        //   Icon(Icons.menu, color: AppColors.ratingThumb),
        // ],
        backgroundColor: AppColors.kPrimaryColorNew,
      ),
      body: ColoredBox(
        color: AppColors.kPrimaryColorNew,
        child: ListView(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    height: 285,
                    child: Scrollbar(
                        child: _TopRatedMovieWidget()
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Популярные', style: TextStyle(color: AppColors.genresText, fontSize: 21, fontWeight: FontWeight.w600),),
                      Text('Все', style: TextStyle(color: AppColors.ratingText, fontSize: 15),),
                    ],
                  ),
                ),
                // TODO тут бага с горизонтальным
                const Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    height: 200,
                    child: Scrollbar(
                        child: _PopularMovieWidget()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // body: Stack(
      //   children: [
      //     // TODO FIX doesn't work
      //     AnimationLimiter(
      //       child: ListView.builder(
      //           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      //           padding: const EdgeInsets.only(top: 70.0),
      //           itemCount: model.movies.length,
      //           itemExtent: 165,
      //           itemBuilder: (BuildContext context, int index) {
      //             model.showedMovieAtIndex(index);
      //             final movie = model.movies[index];
      //             final posterPath = movie.posterPath;
      //             return Padding(
      //               padding: const EdgeInsets.symmetric(
      //                   horizontal: 16.0, vertical: 10.0),
      //               child: Stack(
      //                 children: [
      //                   Container(
      //                     decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         border:
      //                         Border.all(color: Colors.black.withOpacity(0.2)),
      //                         borderRadius:
      //                         const BorderRadius.all(Radius.circular(20.0)),
      //                         boxShadow: [
      //                           BoxShadow(
      //                             color: Colors.black.withOpacity(0.1),
      //                             blurRadius: 8,
      //                             offset: const Offset(0, 2),
      //                           )
      //                         ]),
      //                     clipBehavior: Clip.hardEdge,
      //                     child: Row(
      //                       children: [
      //                         posterPath != null ? Image.network(
      //                             ApiClient.imageUrl(posterPath), width: 95)
      //                             : const SizedBox.shrink(),
      //                         const SizedBox(width: 15.0),
      //                         MovieCard(movie: movie, model: model),
      //                         const SizedBox(width: 10.0),
      //                       ],
      //                     ),
      //                   ),
      //                   Material(
      //                     color: Colors.transparent,
      //                     child: InkWell(
      //                       borderRadius: BorderRadius.circular(20.0),
      //                       onTap: () => model.onMovieTap(context, index),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             );
      //           }),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: TextField(
      //         onChanged: model.searchMovie,
      //         decoration: InputDecoration(
      //           labelText: 'Поиск',
      //           labelStyle: const TextStyle(
      //             color: AppColors.kPrimaryColor,
      //           ),
      //           filled: true,
      //           fillColor: Colors.white.withAlpha(235),
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(10.0),
      //           ),
      //           focusedBorder: const OutlineInputBorder(
      //             borderSide: BorderSide(color: AppColors.kPrimaryColor),
      //           ),
      //           enabledBorder: const OutlineInputBorder(
      //             borderSide: BorderSide(color: AppColors.kPrimaryColor),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class _PopularMovieWidget extends StatelessWidget {
  const _PopularMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularMovieModel = context.watch<MovieListModel>();
    // final popularMovieModel = NotifierProvider.watch<MovieListModel>(context);
    if (popularMovieModel == null) return const SizedBox.shrink();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularMovieModel.movies.length,
        itemExtent: 200,
        itemBuilder: (BuildContext context, int index) {
          popularMovieModel.showedPopularMovieAtIndex(index);
          final popularMovie = popularMovieModel.movies[index];
          final posterPath = popularMovie.posterPath;
          return _PopularMovieListItemWidget(
              index: index,
              posterPath: posterPath,
              movie: popularMovie,
              popularMovieModel: popularMovieModel);
        }
    );
  }
}

class _PopularMovieListItemWidget extends StatelessWidget {
  const _PopularMovieListItemWidget({
    Key? key,
    required this.index,
    required this.posterPath,
    required this.movie,
    required this.popularMovieModel,
  }) : super(key: key);

  final int index;
  final String? posterPath;
  final Movie movie;
  final MovieListModel? popularMovieModel;

  @override
  Widget build(BuildContext context) {
    final popularMovieModel = context.watch<MovieListModel>();
    if (popularMovieModel == null) return SizedBox.shrink();
    // final popularMovieModel = NotifierProvider.watch<MovieListModel>(context);
    final popularMovie = popularMovieModel?.movies[index];
    final posterPath = popularMovie?.posterPath;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0,2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              posterPath != null ? Expanded(
                child: Image.network(
                    ApiClient.imageUrl(posterPath) ,
                ),
              )
                  : const SizedBox.shrink(),
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10, right: 10),
              //     // TODO second line not center
              //     child: Text(
              //       title != null ? title : 'Нет названия',
              //       maxLines: 2,
              //       style: const TextStyle(
              //         fontWeight: FontWeight.w800,
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
              //   child: Text(topRatedMovieModel!.stringFromDate(topMovie!.releaseDate)),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopRatedMovieWidget extends StatelessWidget {
  const _TopRatedMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final topRatedMovieModel = context.watch<TopRatedMovieModel>();
    final topRatedMovieModel = Provider.of<TopRatedMovieModel>(context, listen: true);
    // final topRatedMovieModel = NotifierProvider.watch<MovieListModel>(context);
    if (topRatedMovieModel == null) return const SizedBox.shrink();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: topRatedMovieModel.movies.length,
        itemExtent: 200,
        itemBuilder: (BuildContext context, int index) {
          topRatedMovieModel.showedMovieAtIndex(index);
          final topMovie = topRatedMovieModel.movies[index];
          final posterPath = topMovie.posterPath;
          return InkWell(
            onTap: () => topRatedMovieModel.onMovieTap(context, index),
            child: _TopRatedMovieListItemWidget(
                index: index,
                posterPath: posterPath,
                movie: topMovie,
                topMovieModel: topRatedMovieModel),
          );
        }
    );
  }
}

class _TopRatedMovieListItemWidget extends StatelessWidget {
  const _TopRatedMovieListItemWidget({
    Key? key,
    required this.index,
    required this.posterPath,
    required this.movie,
    required this.topMovieModel,
  }) : super(key: key);
  
  final int index;
  final String? posterPath;
  final Movie movie;
  final TopRatedMovieModel? topMovieModel;

  @override
  Widget build(BuildContext context) {
    final topRatedMovieModel = Provider.of<TopRatedMovieModel>(context, listen: true);
    // final topRatedMovieModel = context.watch<TopRatedMovieModel>();
    // final topRatedMovieModel = NotifierProvider.watch<MovieListModel>(context);
    final topMovie = topRatedMovieModel?.movies[index];
    final posterPath = topMovie?.posterPath;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0,2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              posterPath != null ? Image.network(
                  ApiClient.imageUrl(posterPath), width: 340)
                  : const SizedBox.shrink(),
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10, right: 10),
              //     // TODO second line not center
              //     child: Text(
              //       title != null ? title : 'Нет названия',
              //       maxLines: 2,
              //       style: const TextStyle(
              //         fontWeight: FontWeight.w800,
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
              //   child: Text(topRatedMovieModel!.stringFromDate(topMovie!.releaseDate)),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}


// class MovieCard extends StatelessWidget {
//   const MovieCard({
//     Key? key,
//     required this.movie,
//     required this.model,
//   }) : super(key: key);
//
//   final Movie movie;
//   final MovieListModel? model;
//
//   @override
//   Widget build(BuildContext context) {
//     final model = NotifierProvider.watch<MovieListModel>(context);
//     if (model == null) return const SizedBox.shrink();
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 20.0),
//           Text(
//             movie.title,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 5.0),
//           Text(
//             model.stringFromDate(movie.releaseDate),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(color: Colors.grey),
//           ),
//           const SizedBox(height: 20.0),
//           Text(
//             movie.overview,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }