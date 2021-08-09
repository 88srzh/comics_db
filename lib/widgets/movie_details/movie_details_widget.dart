import 'package:comics_db_app/resources/resources.dart';
import 'package:flutter/material.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.grey[100],
      ),
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
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
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ковбой бибоп',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star),
                          Text('Рейтинг'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 300,
                width: 150,
                child: Image(
                  image: AssetImage(AppImages.waifu),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
