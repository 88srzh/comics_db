import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';

class NewsWidgetPopular extends StatefulWidget {
  const NewsWidgetPopular({Key? key}) : super(key: key);

  @override
  _NewsWidgetPopularState createState() => _NewsWidgetPopularState();
}

class _NewsWidgetPopularState extends State<NewsWidgetPopular> {
  @override
  Widget build(BuildContext context) {
    String? _chosenValue;
    // final tvModel = NotifierProvider.watch<TVListModel>(context);
    // if (tvModel == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Популярное',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              DropdownButton<String>(
                value: _chosenValue,
                onChanged: (String? value) {
                  setState(() {
                    _chosenValue = value;
                  });
                },
                items: <String> [
                  'movies',
                  'tv',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                // [
                //   DropdownMenuItem(value: 'movies', child: Text('Movies')),
                //   DropdownMenuItem(value: 'tv', child: Text('TV')),
                // ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const SizedBox(
          height: 350,
          child: Scrollbar(
            child: _PopularMoviesWidget(),
          ),
        ),
      ],
    );
  }
}

class _PopularMoviesWidget extends StatelessWidget {
  const _PopularMoviesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieModel = NotifierProvider.watch<MovieListModel>(context);
    if (movieModel == null) return const SizedBox.shrink();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movieModel.movies.length,
      itemExtent: 200,
      itemBuilder: (BuildContext context, int index) {
        movieModel.showedPopularMovieAtIndex(index);
        final movie = movieModel.movies[index];
        final posterPath = movie.posterPath;
        return _MovieListItemWidget(
            index: index, posterPath: posterPath, movie: movie, movieModel: movieModel);
      },
    );
  }
}

class _MovieListItemWidget extends StatelessWidget {
  const _MovieListItemWidget({
    Key? key,
    required this.index,
    required this.posterPath,
    required this.movie,
    required this.movieModel,
  }) : super(key: key);

  final int index;
  final String? posterPath;
  final Movie movie;
  final MovieListModel? movieModel;

  @override
  Widget build(BuildContext context) {
    final movieModel = NotifierProvider.watch<MovieListModel>(context);
    final movie = movieModel?.movies[index];
    final posterPath = movie?.posterPath;
    final title = movie?.title;
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    // TODO second line not center
                    child: Text(
                      title != null ? title : 'Нет названия',
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                  child: Text(movieModel!.stringFromDate(movie!.releaseDate)),
                ),
              ],
            ),
          ),
        ),
      );
  }
}