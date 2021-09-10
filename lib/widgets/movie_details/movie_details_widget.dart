import 'dart:ui';

import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    NotifierProvider.read<MovieDetailsModel>(context)?.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _TitleWidget(),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.grey[100],
      ),
      body: Stack(
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Ковбой бибоп',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.star_border_outlined, size: 20),
                              SizedBox(width: 5.0,),
                              Text('4.9', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0,),
                    Row(
                      children: const [
                        Text('Режиссер: ', style: TextStyle(color: Colors.grey),),
                        Text('Хайме Ятате'),
                      ],
                     ),
                     const SizedBox(height: 25.0),
                     Row(
                       children: [
                         Container(
                           decoration: BoxDecoration(
                             color: const Color.fromRGBO(246,246,246, 1.0),
                             borderRadius: BorderRadius.circular(4.0),
                           ),
                           child: const Padding(
                             padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                             child: Text('Экшен', style: TextStyle(color: Colors.grey),),
                           ),
                         ),
                         const SizedBox(width: 5.0,),
                         Container(
                           decoration: BoxDecoration(
                             color: const Color.fromRGBO(246,246,246, 1.0),
                             borderRadius: BorderRadius.circular(4.0),
                           ),
                           child: const Padding(
                             padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                             child: Text('Приключения', style: TextStyle(color: Colors.grey),),
                           ),
                         ),
                         const SizedBox(width: 5.0,),
                         Container(
                           decoration: BoxDecoration(
                             color: const Color.fromRGBO(246,246,246, 1.0),
                             borderRadius: BorderRadius.circular(4.0),
                           ),
                           child: const Padding(
                             padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                             child: Text('Комедия', style: TextStyle(color: Colors.grey),),
                           ),
                         ),
                         const SizedBox(width: 5.0,),
                         Container(
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(4.0),
                             border: Border.all(color: Colors.grey),
                           ),
                           child: const Padding(
                             padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                             child: Text('+3', style: TextStyle(color: Colors.grey),),
                           ),
                         ),
                       ],
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                       child: Row(
                         children: const [
                           Expanded(
                             child: Text('2071 год. Человечество колонизировало всю Солнечную Систему, основав колонии от Венеры до Юпитера. Но десятилетия тому назад из-за техногенной катастрофы была уничтожена Луна. Последствия оказались катастрофическими: непрерывные метеоритные дожди сделали жизнь на поверхности Земли невозможной, а в первые недели после катастрофы погибло 4,7 миллиарда человек. Большая часть выживших перебралась в колонии на другие планеты.',
                               overflow: TextOverflow.ellipsis,
                               maxLines: 6,
                               style: TextStyle(
                             color: Colors.grey,
                             fontSize: 16,
                               ),
                               ),
                           ),
                         ],
                       ),
                     ),
                     ElevatedButton(
                       onPressed: () {},
                       child: const Text('В Избранное', style: TextStyle(fontSize: 24)),
                       style: ButtonStyle(
                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                         backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryColor),
                         padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 85.0, vertical: 15.0),),
                       ),
                       ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: const SizedBox(
                  height: 295.0,
                  width: 210.0,
                  child: Image(
                  image: AssetImage(AppImages.waifu),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Center(child: Text(model?.movieDetails?.title ?? 'Загрузка...', style: const TextStyle(color: Colors.black)));
  }
}

