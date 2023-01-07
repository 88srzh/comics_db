// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_description_expandable_text_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
  }) : super(key: key);

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
          const Text(
            'Biography',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              // TODO rename text
              color: AppColors.genresText,
            ),
          ),
          // if i have empty biography i will have extra sizedbox
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CustomDescriptionExpandableText(description: biography),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
