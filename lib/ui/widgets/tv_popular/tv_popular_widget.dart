import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/widgets/tv_popular/tv_popular_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularTvWidget extends StatelessWidget {
  const PopularTvWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularTvModel = Provider.of<TvPopularModel>(context, listen: true);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularTvModel.tvs.length,
        itemBuilder: (BuildContext context, int index) {
          popularTvModel.showedTVAtIndex(index);
          final popularTv = popularTvModel.tvs[index];
          final posterPath = popularTv.posterPath;
          return InkWell(
            onTap: () => popularTvModel.onTVTap(context, index),
            child: _PopularTvListItemWidget(
              index: index,
              posterPath: posterPath,
              tv: popularTv,
              tvPopularModel: popularTvModel,
            ),
          );
        });
  }
}

class _PopularTvListItemWidget extends StatelessWidget {
  const _PopularTvListItemWidget({
    Key? key,
    required this.index,
    required this.posterPath,
    required this.tv,
    required this.tvPopularModel,
  }) : super(key: key);

  final int index;
  final String? posterPath;
  final TV tv;
  final TvPopularModel? tvPopularModel;

  @override
  Widget build(BuildContext context) {
    final popularTvModel = Provider.of<TvPopularModel>(context, listen: true);
    final popularTv = popularTvModel.tvs[index];
    final posterPath = popularTv.posterPath;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0, right: 10.0),
      child: Container(
        height: 200,
        width: 114,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: FittedBox(
          child: posterPath != null
              ? Image.network(ImageDownloader.imageUrl(posterPath))
              : const SizedBox.shrink(),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
