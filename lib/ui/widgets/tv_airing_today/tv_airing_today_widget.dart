// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/ui/widgets/tv_airing_today/tv_airing_today_cubit.dart';
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';

class AiringTodayTvsWidget extends StatefulWidget {
  const AiringTodayTvsWidget({super.key});

  @override
  State<AiringTodayTvsWidget> createState() => _AiringTodayTvsWidgetState();
}

class _AiringTodayTvsWidgetState extends State<AiringTodayTvsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<TvAiringTodayListCubit>().setupAiringTodayTvLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvAiringTodayListCubit>();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cubit.state.tvs.length,
        itemBuilder: (BuildContext context, int index) {
          cubit.showedAiringTodayTvAtIndex(index);
          final airingTodayTv = cubit.state.tvs[index];
          final posterPath = airingTodayTv.posterPath;
          return InkWell(
            onTap: () => cubit.onTvTap(context, index),
            child: _AiringTodayTvsListItemWidget(
              index: index,
              posterPath: posterPath,
              tv: airingTodayTv,
              cubit: cubit,
            ),
          );
        });
  }
}

class _AiringTodayTvsListItemWidget extends StatelessWidget {
  const _AiringTodayTvsListItemWidget({
    required this.index,
    required this.posterPath,
    required this.tv,
    required this.cubit,
  });

  final int index;
  final String? posterPath;
  final TvListData tv;
  final TvAiringTodayListCubit cubit;

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
