// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_description_expandable_text_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';

class TvDescriptionWidget extends StatelessWidget {
  const TvDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvDetailsCubit>();
    final overview = cubit.state.overview;
    if (overview.isEmpty) return const SizedBox.shrink();
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
                child: CustomDescriptionExpandableText(description: overview),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
