import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvDetailsOtherInformationWidget extends StatelessWidget {
  const TvDetailsOtherInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var networks = context.read<TvDetailsCubit>().state.networks;
    final String? logoPath = networks.first.logoPath;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Row(
        children: [
          Column(
            children: [
              Text('TV network', style: Theme.of(context).textTheme.labelMedium),
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
        ],
      ),
    );
  }
}
