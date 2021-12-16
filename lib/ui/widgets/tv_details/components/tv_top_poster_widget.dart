import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvTopPosterWidget extends StatelessWidget {
  const TvTopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvModel = Provider.of<TvDetailsModel>(context, listen: true);
    final posterPath = tvModel.tvDetails?.posterPath;
    final backdropPath = tvModel.tvDetails?.backdropPath;
    return Stack(
      children: [
        Positioned(
            child: AspectRatio(
              aspectRatio: 390/220,
              child: backdropPath != null ? Image.network(ApiClient.imageUrl(backdropPath))
              : const SizedBox.shrink(),
            )
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: Container(
              clipBehavior: Clip.antiAlias,
              // TODO: проверить закругляет ли края
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              height: 212.0,
              width: 174.0,
              child: posterPath != null ? Image.network(ApiClient.imageUrl(posterPath))
              : const SizedBox.shrink(),
            ),
          ),
        ),
        // TODO: исправить стрелку, чтобы не съезжала
        Positioned(
          left: 10,
            top: 10,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_sharp, color: Colors.white),
            ),
        ),
      ],
    );
  }
}
