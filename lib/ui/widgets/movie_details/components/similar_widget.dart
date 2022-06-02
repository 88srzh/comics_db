import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/movie_list/popular_movie_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSimilarWidget extends StatelessWidget {
  const MovieSimilarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Рекомендации',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: AppColors.genresText,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0),
                        child: SizedBox(
                          height: 200,
                          // TOD0: rename
                          child: _SimilarListMovieWidget(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SimilarListMovieWidget extends StatefulWidget {
  const _SimilarListMovieWidget({Key? key}) : super(key: key);

  @override
  State<_SimilarListMovieWidget> createState() => _SimilarListMovieWidgetState();
}

class _SimilarListMovieWidgetState extends State<_SimilarListMovieWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<MovieListViewModel>().setupPopularMovieLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

