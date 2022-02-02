import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/ui/widgets/trending/trending_all_model.dart';
import 'package:flutter/material.dart';

class NewsWidgetTrending extends StatefulWidget {
  const NewsWidgetTrending({Key? key}) : super(key: key);

  @override
  _NewsWidgetTrendingState createState() => _NewsWidgetTrendingState();
}

class _NewsWidgetTrendingState extends State<NewsWidgetTrending> {
  final _category = 'movies';
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TrendingAllModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Новое',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              DropdownButton<String>(
                value: _category,
                onChanged: (category) {},
                items: const [
                  DropdownMenuItem(
                      value: 'movies', child: Text('Фильмы')),
                  DropdownMenuItem(value: 'tv', child: Text('Сериалы')),
                  DropdownMenuItem(
                      value: 'tvShows', child: Text('TVShows')),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 306,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: model.trendingAll.length,
            itemExtent: 150,
            itemBuilder: (BuildContext context, int index) {
              model.showedTrendingAllAtIndex(index);
              final trendingAll = model.trendingAll[index];
              final posterPath = trendingAll.posterPath;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: posterPath != null ? Image.network(
                            ImageDownloader.imageUrl(posterPath)
                          ) : const SizedBox.shrink()
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.more_horiz),
                          ),
                        ),
                        // Positioned(
                        //   left: 10,
                        //   bottom: 0,
                        //   child: SizedBox(
                        //     width: 40,
                        //     height: 40,
                        //     child: RadialPercentWidget(
                        //       percent: 0.68,
                        //       fillColor: const Color.fromARGB(255, 10, 23, 25),
                        //       lineColor:
                        //           const Color.fromARGB(255, 37, 203, 103),
                        //       freeColor: const Color.fromARGB(255, 25, 54, 31),
                        //       lineWidth: 3,
                        //       child: const Text(
                        //         '68%',
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 11,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Text(
                        'Willy`s Wonderland',
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Text('Feb 12, 2021'),
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