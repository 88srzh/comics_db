import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class MoviePopularWidget extends StatelessWidget {
//   const MoviePopularWidget({Key? key}) : super(key: key);
//   @override
//   // TODO возможно сделать виджет закрытым
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//       create: (context) => MoviePopularListViewModel(), child: const MoviePopularListWidget());
// }

class MoviePopularListWidget extends StatefulWidget {
  const MoviePopularListWidget({Key? key}) : super(key: key);

  @override
  State<MoviePopularListWidget> createState() => _MoviePopularListWidgetState();
}

class _MoviePopularListWidgetState extends State<MoviePopularListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<MoviePopularListViewModel>().setupLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MoviePopularListViewModel>();
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 70.0),
          itemCount: model.movies.length,
          itemExtent: 165,
          itemBuilder: (BuildContext context, int index) {
            model.showedPopularMovieAtIndex(index);
            final movie = model.movies[index];
            final posterPath = movie.posterPath;
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          )
                        ]),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        posterPath != null
                            ? Image.network(
                                ImageDownloader.imageUrl(posterPath),
                                width: 95)
                            : const SizedBox.shrink(),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20.0),
                              Text(
                                movie.originalTitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              // Text(
                              //   model.stringFromDate(movie.firstAirDate),
                              //   maxLines: 1,
                              //   overflow: TextOverflow.ellipsis,
                              //   style: const TextStyle(color: Colors.grey),
                              // ),
                              const SizedBox(height: 20.0),
                              Text(
                                movie.overview,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20.0),
                      onTap: () => model.onMovieTap(context, index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: TextField(
        //     onChanged: model.searchMovie,
        //     decoration: InputDecoration(
        //       labelText: 'Поиск',
        //       labelStyle: const TextStyle(
        //         color: AppColors.kPrimaryColor,
        //       ),
        //       filled: true,
        //       fillColor: Colors.white.withAlpha(235),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //       focusedBorder: const OutlineInputBorder(
        //         borderSide: BorderSide(color: AppColors.kPrimaryColor),
        //       ),
        //       enabledBorder: const OutlineInputBorder(
        //         borderSide: BorderSide(color: AppColors.kPrimaryColor),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
