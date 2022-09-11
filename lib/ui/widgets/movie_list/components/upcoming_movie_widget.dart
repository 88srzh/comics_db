import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/upcoming_movie_list/upcoming_movie_cubit.dart';
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
    final locale = Localizations.localeOf(context);
    context.read<UpcomingMovieListCubit>().setupUpcomingMovieLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<UpcomingMovieListCubit>();

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
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        _currentMovie = value;
                      });
                    },
                    // TODO: уменьшить кол-во фильмов либо исправить ползунок
                    itemCount: cubit.state.movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      cubit.showedUpcomingMovieAtIndex(index);
                      final movie = cubit.state.movies[index];
                      final backdropPath = movie.backdropPath;
                      return Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () => cubit.onMovieTap(context, index),
                          child: backdropPath != null
                              ? Image.network(ImageDownloader.imageUrl(backdropPath))
                              : const SizedBox.shrink(),
                        ),
                      );
                    }),
              ),
              // TODO: add to separate widget
              Positioned(
                left: 50,
                top: 40,
                right: 50,
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // TODO: fix endless list
                    children: List.generate(
                      20,
                      (index) => buildDotNew(index: index),
                      growable: false,
                    ),
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
