import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/ui/widgets/tv_airing_today/tv_airing_today_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiringTodayTvsWidget extends StatelessWidget {
  const AiringTodayTvsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final airingTodayTvsTvModel = Provider.of<AiringTodayTvsModel>(context, listen: true);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: airingTodayTvsTvModel.tvs.length,
        itemBuilder: (BuildContext context, int index) {
          airingTodayTvsTvModel.showedTVAtIndex(index);
          final airingTodayTv = airingTodayTvsTvModel.tvs[index];
          final posterPath = airingTodayTv.posterPath;
          return InkWell(
            onTap: () => airingTodayTvsTvModel.onTVTap(context, index),
            child: _AiringTodayTvsListItemWidget(
              index: index,
              posterPath: posterPath,
              tv: airingTodayTv,
              airingTodayTvsModel: airingTodayTvsTvModel,
            ),
          );
        }
    );
  }
}

class _AiringTodayTvsListItemWidget extends StatelessWidget {
  const _AiringTodayTvsListItemWidget({
    Key? key,
    required this.index,
    required this.posterPath,
    required this.tv,
    required this.airingTodayTvsModel,
  }) : super(key: key);

  final int index;
  final String? posterPath;
  final TV tv;
  final AiringTodayTvsModel? airingTodayTvsModel;

  @override
  Widget build(BuildContext context) {
    final airingTodayTvsTvModel = Provider.of<AiringTodayTvsModel>(context, listen: true);
    final airingTodayTv = airingTodayTvsTvModel.tvs[index];
    final posterPath = airingTodayTv.posterPath;
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
          child: posterPath != null ? Image.network(ApiClient.imageUrl(posterPath))
              : const SizedBox.shrink(),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
