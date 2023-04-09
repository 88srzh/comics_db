// Flutter imports:
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/cast_and_crew.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/peoples_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/top_poster_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<MovieDetailsCubit>().setupMovieDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieDetailsCubit>();
    // var data = MovieDetailsData();
    // IconData favoriteIcon = cubit.favoriteIcon;
    // var favorite = cubit.data.favoriteData.isFavorite;

    // С этой строки меняется, но не сохраняется иконка
    // var favorite = data.favoriteData.isFavorite;
    var favorite = cubit.isFavorite;
    final int movieId = cubit.movieId;


    Widget fab(VoidCallback onPressed) {
      return FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Colors.orange,
        onPressed: onPressed,
        child: favorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
        // child: favorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
        // child: Icon(data.favoriteData.favoriteIcon),
      );
    }

    return Scaffold(
      appBar: CustomDetailsAppBar(title: 'Movie Details', movieId: movieId),
      floatingActionButton: fab(() => cubit.toggleFavoriteMovie(context)),
      body: ListView(
        children: [
          Column(
            children: const [
              MovieTopPosterWidget(),
              PeoplesWidget(),
              DescriptionWidget(),

              // TODO doesn't work, the request contains an invalid parameter value, need microtask
              // TrailerWidget(youtubeKey: trailerKey),

              CastWidget(),
              // const MovieSimilarWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
