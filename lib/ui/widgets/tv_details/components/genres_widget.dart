import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final genres =
    //     context.select((TvDetailsModel model) => model.tvData.genres);
    final cubit = context.watch<TvDetailsCubit>();
    final genres = cubit.state.genres;
    return Text(
      genres,
      maxLines: 3,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
