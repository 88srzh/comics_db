import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvDetailsTitleWidget extends StatelessWidget {
  const TvDetailsTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvDetailsCubit>();
    final String name = cubit.state.name;
    final String? tagline = cubit.state.tagline;
    final String firstAirDate = cubit.state.firstAirDate ?? 'No first air data';
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: Text(
                  '$name ($firstAirDate)',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tagline != null ?
              Flexible(
                child: Text(
                  textAlign: TextAlign.center,
                  tagline,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ) : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
