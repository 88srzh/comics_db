import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/generated/l10n.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvDetailsOtherInformationWidget extends StatelessWidget {
  final String statusText;
  const TvDetailsOtherInformationWidget({super.key, required this.statusText});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TvDetailsCubit>();
    final String? logoPath = cubit.state.networks.first.logoPath;
    final String originalLanguage = cubit.state.originalLanguage;
    final String status = cubit.state.status;
    final String type = cubit.state.type;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(statusText, style: Theme.of(context).textTheme.labelMedium),
              Text(status, style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(height: 10.0),
              logoPath != null ? Text('TV network', style: Theme.of(context).textTheme.labelMedium) : const SizedBox.shrink(),
              logoPath != null
                  ? SizedBox(
                      width: 150.0,
                      child: CachedNetworkImage(
                        imageUrl: ImageDownloader.imageUrl(logoPath),
                        placeholder: (context, url) => const LoadingIndicatorWidget(),
                        errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(width: 50.0),
          Column(
            children: [
              Text(S.of(context).type, style: Theme.of(context).textTheme.labelMedium),
              Text(type, style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(height: 10.0),
              Text(S.of(context).originalLanguage, style: Theme.of(context).textTheme.labelMedium),
              Text(originalLanguage, style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
