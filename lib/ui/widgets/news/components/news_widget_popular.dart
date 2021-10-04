import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_list_model.dart';
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
    final movieModel = NotifierProvider.watch<MovieListModel>(context);
    if (movieModel == null) return const SizedBox.shrink();
    final tvModel = NotifierProvider.watch<TVListModel>(context);
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
        Container(
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieModel.movies.length,
            itemExtent: 150,
            itemBuilder: (BuildContext context, int index) {
              movieModel.showedMovieAtIndex(index);
              final movie = movieModel.movies[index];
              final posterPath = movie.posterPath;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Stack(
                      children: [
                        Column(
                        children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: posterPath != null ? Image.network(
                              ApiClient.imageUrl(posterPath), width: 340)
                              : const SizedBox.shrink(),
                            ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  movie.title,
                                  maxLines: 2,
                                  style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                            child: Text(movieModel.stringFromDate(movie.releaseDate)),
                        ),
                        ],
                      ),
                      ],
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}