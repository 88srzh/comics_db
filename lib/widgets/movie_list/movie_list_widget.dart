import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/widgets/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieListModel>(context);
    if (model == null) return const SizedBox.shrink();
    // Временный скаффолд с аппбаром с кнопкой
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => SessionDataProvider().setSessionId(null),
            child: const Text('Logout'),
            ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 70.0),
              itemCount: model.movies.length,
              itemExtent: 165,
              itemBuilder: (BuildContext context, int index) {
                model.showedMovieAtIndex(index);
                final movie = model.movies[index];
                final posterPath = movie.posterPath;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
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
                            posterPath != null ? Image.network(ApiClient.imageUrl(posterPath), width: 95) : const SizedBox.shrink(),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20.0),
                                  Text(
                                    movie.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    model.stringFromDate(movie.releaseDate),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
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
              }),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: model.searchMovie,
              decoration: InputDecoration(
                labelText: 'Поиск',
                labelStyle: const TextStyle(
                  color: AppColors.kPrimaryColor,
                ),
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kPrimaryColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kPrimaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
