// Flutter imports:
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';
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
            onTap: () => onTvTap(context, index),
            child: _PopularTvListItemWidget(
              index: index,
              posterPath: posterPath,
              tv: popularTv,
              cubit: cubit,
            ),
          );
        });
  }
}

void onTvTap(BuildContext context, int index) {
  final cubit = context.read<TvPopularListCubit>();
  final tvId = cubit.state.tvs[index].id;
  Navigator.of(context).pushNamed(MainNavigationRouteNames.tvDetails, arguments: tvId);
}

class _PopularTvListItemWidget extends StatelessWidget {
  const _PopularTvListItemWidget({
    Key? key,
    required this.index,
    required this.posterPath,
    required this.tv,
    required this.cubit,
  }) : super(key: key);

  final int index;
  final String? posterPath;
  final TvListData tv;
  final TvPopularListCubit cubit;

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
          child: posterPath != null ? Image.network(ImageDownloader.imageUrl(posterPath!)) : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
