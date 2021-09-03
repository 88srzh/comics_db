import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/widgets/news/components/latest_all_model.dart';
import 'package:flutter/material.dart';

class NewsWidgetLatest extends StatefulWidget {
  const NewsWidgetLatest({Key? key}) : super(key: key);

  @override
  _NewsWidgetLatestState createState() => _NewsWidgetLatestState();
}

class _NewsWidgetLatestState extends State<NewsWidgetLatest> {
  final _category = 'movies';
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<LatestAllModel>(context);
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
                  DropdownMenuItem(value: 'movies', child: Text('Фильмы')),
                  DropdownMenuItem(value: 'tv', child: Text('Сериалы')),
                  DropdownMenuItem(value: 'tvShows', child: Text('TVShows')),
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
            itemCount: 10,
            itemExtent: 150,
            itemBuilder: (BuildContext context, int index) {
              model.showedLatestAllAtIndex(index);
              final latestAll = model.latestAll[index];
              final posterPath = latestAll.posterPath;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child:
                          posterPath != null ? Image.network(ApiClient.imageUrl(posterPath)) : const SizedBox.shrink(),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Text(
                        latestAll.title,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Text(
                        model.stringFromDate(latestAll.releaseDate),
                      ),
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
