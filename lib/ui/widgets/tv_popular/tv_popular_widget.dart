// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/core/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/tv_list/tv_popular_list_cubit.dart';

class PopularTvWidget extends StatefulWidget {
  const PopularTvWidget({Key? key}) : super(key: key);

  @override
  State<PopularTvWidget> createState() => _PopularTvWidgetState();
}

class _PopularTvWidgetState extends State<PopularTvWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<TvPopularListCubit>().setupPopularTvLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvPopularListCubit>();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cubit.state.tvs.length,
        itemBuilder: (BuildContext context, int index) {
          cubit.showedPopularTvAtIndex(index);
          final popularTv = cubit.state.tvs[index];
          final posterPath = popularTv.posterPath;
          return InkWell(
            onTap: () => cubit.onTvTap(context, index),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0, right: 10.0),
              child: Container(
                height: 200,
                width: 114,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: AppColors.movieBorderLine,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: posterPath != null
                      ? CachedNetworkImage(imageUrl: ImageDownloader.imageUrl(posterPath))
                      : const SizedBox.shrink(),
                ),
              ),
            ),
          );
        });
  }
}
