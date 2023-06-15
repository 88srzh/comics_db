import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_description_expandable_text_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieDetailsCubit>();
    var overview = cubit.state.overview;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CustomDescriptionExpandableText(description: overview),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
