import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleGenresRatingVoteAverageWidget extends StatelessWidget {
  const TitleGenresRatingVoteAverageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvModel = Provider.of<TvDetailsModel>(context, listen: true);
    var voteAverage = tvModel.tvDetails?.voteAverage ?? 0;
    voteAverage = voteAverage *10;
    var voteCount = tvModel.tvDetails?.voteCount.toString() ?? '0';


    var texts = <String>[];
    final genres = tvModel.tvDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genre in genres) {
        genresNames.add(genre.name);
      }
      texts.add(genresNames.join(', '));
    }
    return Center(
     child: Column(
       children: [
         const SizedBox(height: 12),
         SizedBox(
           child: Text(tvModel.tvDetails?.name ?? 'Загрузка названия',
             style: const TextStyle(
               fontSize: 21,
               fontWeight: FontWeight.w600,
               color: AppColors.titleText,
             ),
           ),
         ),
         const SizedBox(height: 8),
         Text(
           texts.join(' '),
           maxLines: 3,
           textAlign: TextAlign.center,
           style: const TextStyle(
             fontSize: 13,
             color: AppColors.genresText,
           ),
         ),
         const SizedBox(height: 4),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Icon(Icons.star, color: AppColors.ratingStar, size: 14),
             const SizedBox(width: 2),
             // TODO: не очень симпотишно, исправить
             Text(voteCount,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.ratingText,
              ),
             ),
             const Text(' пользовательский счет',
               style: TextStyle(
                 fontSize: 13,
                 color: AppColors.ratingText,
               ),
             )

           ],
         )
       ],
     ),
    );
  }
}
