import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/widgets/tv_top_rated/tv_top_rated_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopRatedTvWidget extends StatelessWidget {
  const TopRatedTvWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topRatedTvModel = Provider.of<TvTopRatedModel>(context, listen: true);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: topRatedTvModel.tvs.length,
        itemBuilder: (BuildContext context, int index) {
          topRatedTvModel.showedTVAtIndex(index);
          final topTv = topRatedTvModel.tvs[index];
          final backdropPath = topTv.backdropPath;
          return InkWell(
            onTap: () => topRatedTvModel.onTVTap(context, index),
            child: _TopRatedTvListItemWidget(
              index: index,
              backdropPath: backdropPath,
              tv: topTv,
              topTvModel: topRatedTvModel,
            ),
          );
        }
    );
  }
}

class _TopRatedTvListItemWidget extends StatelessWidget {
  const _TopRatedTvListItemWidget({
    Key? key,
    required this.index,
    required this.backdropPath,
    required this.tv,
    required this.topTvModel,

  }) : super(key: key);
    final int index;
    final String? backdropPath;
    final TV tv;
    final TvTopRatedModel? topTvModel;

  @override
  Widget build(BuildContext context) {
    final topRatedTvModel = Provider.of<TvTopRatedModel>(context, listen: true);
    final topTv = topRatedTvModel.tvs[index];
    final backdropPath = topTv.backdropPath;
    return Padding(
        padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        width: 320,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: FittedBox(
          child: backdropPath != null ? Image.network(ApiClient.imageUrl(backdropPath)) : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

