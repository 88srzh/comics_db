import 'package:comics_db_app/resources/resources.dart';
import 'package:flutter/material.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemExtent: 165,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
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
                      const Image(image: AssetImage(AppImages.waifu)),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 20.0),
                            Text(
                              'waifu',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'August 8, 2021',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Сложно исправить ошибки прошлого. Некоторые — невозможно. Когда жизнь начинает идти под откос ещё со средней школы, стоило бы бороться, но прогнуться и плыть по течению проще и безопаснее.',
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
                    onTap: () {},
                  ),
                ),
              ],
            ),
          );
        });
  }
}
