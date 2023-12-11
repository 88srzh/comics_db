import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvDetailsCubit>();
    final name = cubit.state.name;
    final tagline = cubit.state.tagline;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 2),
          ],
        ),
        SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  textAlign: TextAlign.center,
                  tagline,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
