import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<PeopleDetailsCubit>();
    var biography = cubit.state.biography;
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
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                // TODO: Добавить расстояние между строками
                child: ExpandableText(
                  biography,
                  expandText: '',
                  maxLines: 5,
                  linkColor: Colors.deepOrangeAccent,
                  animation: true,
                  expandOnTextTap: true,
                  prefixText: ' ',
                  linkEllipsis: false,
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
