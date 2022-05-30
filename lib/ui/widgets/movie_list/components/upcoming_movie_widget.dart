import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/upcoming_movie/upcoming_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpcomingMovieWidget extends StatefulWidget {
  const UpcomingMovieWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<UpcomingMovieWidget> createState() => _UpcomingMovieWidgetState();
}

class _UpcomingMovieWidgetState extends State<UpcomingMovieWidget> {
  int _currentMovie = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<UpcomingMovieModel>().setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    final upcomingMovieModel = context.watch<UpcomingMovieModel>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 350,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  // color: AppColors.movieBorderLine,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        _currentMovie = value;
                      });
                    },
                    // TODO: уменьшить кол-во фильмов либо исправить ползунок
                    itemCount: upcomingMovieModel.movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      upcomingMovieModel.showedMovieAtIndex(index);
                      final upcomingMovie = upcomingMovieModel.movies[index];
                      final backdropPath = upcomingMovie.backdropPath;
                      return InkWell(
                        onTap: () => upcomingMovieModel.onMovieTap(context, index),
                        child: backdropPath != null
                            ? Image.network(ImageDownloader.imageUrl(backdropPath))
                            : const SizedBox.shrink(),
                      );
                    }),
              ),
              // TODO: сделать в отдельный виджет
              Positioned(
                left: 50,
                top: 40,
                right: 50,
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(upcomingMovieModel.movies.length, (index) => buildDotNew(index: index)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  AnimatedContainer buildDotNew({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5.0),
      height: 6,
      width: _currentMovie == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentMovie == index ? Colors.white : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
