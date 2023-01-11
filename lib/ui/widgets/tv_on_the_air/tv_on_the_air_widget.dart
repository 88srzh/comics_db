// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';
import 'package:comics_db_app/ui/widgets/tv_on_the_air/tv_on_the_air_cubit.dart';

class OnTheAirTvsWidget extends StatefulWidget {
  const OnTheAirTvsWidget({Key? key}) : super(key: key);

  @override
  State<OnTheAirTvsWidget> createState() => _OnTheAirTvsWidgetState();
}

class _OnTheAirTvsWidgetState extends State<OnTheAirTvsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context
        .read<TvOnTheAirListCubit>()
        .setupOnTheAirTvLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvOnTheAirListCubit>();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cubit.state.tvs.length,
        itemBuilder: (BuildContext context, int index) {
          cubit.showedOnTheAirTvAtIndex(index);
          final onTheAirTv = cubit.state.tvs[index];
          final posterPath = onTheAirTv.posterPath;
          return InkWell(
            onTap: () => cubit.onTvTap(context, index),
            child: _AiringTodayTvsListItemWidget(
              index: index,
              posterPath: posterPath,
              tv: onTheAirTv,
              cubit: cubit,
            ),
          );
        });
  }
}

class _AiringTodayTvsListItemWidget extends StatelessWidget {
  const _AiringTodayTvsListItemWidget({
    Key? key,
    required this.index,
    required this.posterPath,
    required this.tv,
    required this.cubit,
  }) : super(key: key);

  final int index;
  final String? posterPath;
  final TvListData tv;
  final TvOnTheAirListCubit cubit;

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
              ? Image.network(ImageDownloader.imageUrl(posterPath!))
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
