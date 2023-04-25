// Flutter imports:
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

class TvDescriptionWidget extends StatelessWidget {
  const TvDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final overview =
    //     context.select((TvDetailsModel model) => model.tvData.overview);
    final cubit = context.watch<TvDetailsCubit>();
    final overview = cubit.state.overview;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sinopsis',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                // Добавить расстояние между строками
                child: Text(
                  overview,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
