import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_new_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    // context.read<MovieDetailsCubit>().setupLocale(locale.languageCode);
    context.read<MovieDetailsNewCubit>().setupMovieDetailsLocale(locale.languageCode);
    // Future.microtask(
    //   () => context.read<MovieDetailsCubit>().setupLocale(context, locale),
    // );
    // context.read<MovieListCubit>().setupPopularMovieLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    // final isLoading = context.select((MovieDetailsModel model) => model.data.isLoading);
    // final cubit = context.watch<MovieDetailsCubit>();

    // if (isLoading) {
    //   return const Center(
    //     child: LoadingIndicatorWidget(),
    //   );
    // }
    // var trailerData = context.select((MovieDetailsModel model) => model.data.trailerData);
    // final trailerKey = trailerData.trailerKey;

    // final cubit = context.watch<MovieDetailsCubit>();
    final cubit = context.watch<MovieDetailsNewCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movie Details'),
      ),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final movie = cubit.state.movies[index];
            return Column(
            children: [
            // const MovieTopPosterWidget(),
            // const PeoplesWidget(),
            DescriptionWidget(movieListData: movie, cubit: cubit, index: index),
            // TrailerWidget(youtubeKey: trailerKey),
            // const CastWidget(),
            // const MovieSimilarWidget(),
            ],
            );
          },
        ),
      ),
    );
  }
}
