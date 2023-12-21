// Flutter imports:
import 'package:comics_db_app/ui/widgets/tv_discover_list/tv_discover_list_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';

class DiscoverTvsWidget extends StatefulWidget {
  const DiscoverTvsWidget({Key? key}) : super(key: key);

  @override
  State<DiscoverTvsWidget> createState() => _DiscoverTvsWidgetState();
}

class _DiscoverTvsWidgetState extends State<DiscoverTvsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<TvDiscoverPopularListCubit>().setupDiscoverPopularTvLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvDiscoverPopularListCubit>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cubit.state.tvs.length,
      itemBuilder: (BuildContext context, int index) {
        cubit.showedDiscoverPopularTvAtIndex(index);
        final onTheAirTv = cubit.state.tvs[index];
        final posterPath = onTheAirTv.posterPath;
        return InkWell(
          onTap: () => cubit.onTvTap(context, index),
          child: _DiscoverPopularTvsListItemWidget(
            index: index,
            posterPath: posterPath,
            tv: onTheAirTv,
            cubit: cubit,
          ),
        );
      },
    );
  }
}

class _DiscoverPopularTvsListItemWidget extends StatelessWidget {
  const _DiscoverPopularTvsListItemWidget({
    Key? key,
    required this.index,
    required this.posterPath,
    required this.tv,
    required this.cubit,
  }) : super(key: key);

  final int index;
  final String? posterPath;
  final TvListData tv;
  final TvDiscoverPopularListCubit cubit;

  @override
  Widget build(BuildContext context) {
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
          fit: BoxFit.contain,
          child: posterPath != null
              ? CachedNetworkImage(
                  imageUrl: ImageDownloader.imageUrl(posterPath!),
                  placeholder: (context, url) => const LoadingIndicatorWidget(),
                  errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
