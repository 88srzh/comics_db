// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';
import 'package:comics_db_app/ui/widgets/tv_top_rated/tv_top_rated_list_cubit.dart';

class TopRatedTvWidget extends StatefulWidget {
  const TopRatedTvWidget({Key? key}) : super(key: key);

  @override
  State<TopRatedTvWidget> createState() => _TopRatedTvWidgetState();
}

class _TopRatedTvWidgetState extends State<TopRatedTvWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context
        .read<TvTopRatedListCubit>()
        .setupTopRatedTvLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvTopRatedListCubit>();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cubit.state.tvs.length,
        itemBuilder: (BuildContext context, int index) {
          cubit.showedTopRatedTvAtIndex(index);
          final topTv = cubit.state.tvs[index];
          final backdropPath = topTv.backdropPath;
          return InkWell(
            onTap: () => cubit.onTvTap(context, index),
            child: _TopRatedTvListItemWidget(
              index: index,
              backdropPath: backdropPath,
              tv: topTv,
              cubit: cubit,
            ),
          );
        });
  }
}

class _TopRatedTvListItemWidget extends StatelessWidget {
  const _TopRatedTvListItemWidget({
    Key? key,
    required this.index,
    required this.backdropPath,
    required this.tv,
    required this.cubit,
  }) : super(key: key);
  final int index;
  final String? backdropPath;
  final TvListData tv;
  final TvTopRatedListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        width: 320,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: backdropPath != null
            ? Image.network(ImageDownloader.imageUrl(backdropPath!))
            : Image.asset(AppImages.imageNotAvailableHorizontal),
      ),
    );
  }
}
