import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvDescriptionWidget extends StatelessWidget {
  const TvDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final overview = context.select((TvDetailsModel model) => model.tvData.overview);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sinopsis',
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
                // Добавить расстояние между строками
                child: Text(
                  overview,
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
