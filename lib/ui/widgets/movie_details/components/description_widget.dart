import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_new_cubit.dart';
import 'package:comics_db_app/ui/widgets/movie_list/components/movie_list_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {

  const DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final overview =
    //     context.select((MovieDetailsModel model) => model.data.overview);
    // var cubit = context.watch<MovieDetailsCubit>();
    // var overview = cubit.movieDetailsBloc.state.movieDetailsBlocData.overview;
    var newCubit = context.watch<MovieDetailsNewCubit>();
    // var overview = newCubit.state.movies[index].overview;
    // cubit.state
    // var overview = newCubit.state.movies[index].overview;
    // final overview = context.select((MovieDetailsNewCubit cubit) => cubit.overview);

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              // TODO rename text
              color: AppColors.genresText,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                // TODO: Добавить расстояние между строками
                child: Text(
                  // overview,
                  '123',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: const TextStyle(
                    color: AppColors.genresText,
                    fontSize: 12,
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
