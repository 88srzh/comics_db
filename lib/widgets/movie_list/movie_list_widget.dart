import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:comics_db_app/components/movie.dart';

class MovieListWidget extends StatefulWidget {

  const MovieListWidget({Key? key}) : super(key: key);

  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        imageName: AppImages.waifu,
        title: 'Бродяга Кэнсин',
        time: 'Август 8, 2021',
        description:
            'Сложно исправить ошибки прошлого. Некоторые — невозможно. Когда жизнь начинает идти под откос ещё со средней школы, стоило бы бороться, но прогнуться и плыть по течению проще и безопаснее.'),
    Movie(
        imageName: AppImages.waifu,
        title: 'Ковбой Бибоп',
        time: 'Август 8, 2021',
        description:
            'Сложно исправить ошибки прошлого. Некоторые — невозможно. Когда жизнь начинает идти под откос ещё со средней школы, стоило бы бороться, но прогнуться и плыть по течению проще и безопаснее.'),
    Movie(
        imageName: AppImages.waifu,
        title: 'Шаман-Кинг',
        time: 'Август 8, 2021',
        description:
            'Сложно исправить ошибки прошлого. Некоторые — невозможно. Когда жизнь начинает идти под откос ещё со средней школы, стоило бы бороться, но прогнуться и плыть по течению проще и безопаснее.'),
    Movie(
        imageName: AppImages.waifu,
        title: 'Мое превращение в слизь',
        time: 'Август 8, 2021',
        description:
            'Сложно исправить ошибки прошлого. Некоторые — невозможно. Когда жизнь начинает идти под откос ещё со средней школы, стоило бы бороться, но прогнуться и плыть по течению проще и безопаснее.'),
    Movie(
        imageName: AppImages.waifu,
        title: 'Токийская гуль',
        time: 'Август 8, 2021',
        description:
            'Сложно исправить ошибки прошлого. Некоторые — невозможно. Когда жизнь начинает идти под откос ещё со средней школы, стоило бы бороться, но прогнуться и плыть по течению проще и безопаснее.'),
    Movie(
        imageName: AppImages.waifu,
        title: 'Мифический дух - Хроники',
        time: 'Август 8, 2021',
        description:
            'Сложно исправить ошибки прошлого. Некоторые — невозможно. Когда жизнь начинает идти под откос ещё со средней школы, стоило бы бороться, но прогнуться и плыть по течению проще и безопаснее.'),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(() {_searchMovies();});
  }

  void _onMovieTap(int index) {

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 70.0),
            itemCount: _filteredMovies.length,
            itemExtent: 165,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
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
                          Image(image: AssetImage(movie.imageName)),
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
                                  movie.time,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 20.0),
                                Text(
                                  movie.description,
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
                        onTap: () => _onMovieTap(index),
                      ),
                    ),
                  ],
                ),
              );
            }),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
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
            )),
      ],
    );
  }
}
