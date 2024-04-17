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
    final String originalLanguage = cubit.state.originalLanguage;
    final String status = cubit.state.status;
    final String type = cubit.state.type;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(statusText, style: Theme.of(context).textTheme.labelMedium),
          Text(status, style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 10.0),
          Text(S.of(context).televisionNetwork, style: Theme.of(context).textTheme.labelMedium),
          SizedBox(
            height: 40.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: cubit.state.networks.length,
              itemBuilder: (context, index) {
                final String? logoPath = cubit.state.networks[index].logoPath;
                return CachedNetworkImage(
                  width: 100.0,
                  imageUrl: ImageDownloader.imageUrl(logoPath!),
                  placeholder: (context, url) => const LoadingIndicatorWidget(),
                  errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Text(S.of(context).type, style: Theme.of(context).textTheme.labelMedium),
          Text(type, style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 10.0),
          Text(S.of(context).originalLanguage, style: Theme.of(context).textTheme.labelMedium),
          Text(originalLanguage, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
