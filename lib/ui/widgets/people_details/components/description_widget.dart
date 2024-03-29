// Flutter imports:
import 'package:comics_db_app/generated/l10n.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_description_expandable_text_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';

class DescriptionWidget extends StatelessWidget {
  final String biographyTitle;

  const DescriptionWidget({
    super.key,
    required this.biographyTitle,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<PeopleDetailsCubit>();
    var biography = cubit.state.biography;
    if (biography.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            biographyTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          // if i have empty biography i will have extra SizedBox
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CustomDescriptionExpandableText(description: biography, maxLines: 5, expandedText: S.of(context).readTheRest),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
