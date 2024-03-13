// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';

class HeadAccountCardWidget extends StatelessWidget {
  const HeadAccountCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<AccountDetailsCubit>();
    final String username = cubit.state.username;
    final String? avatarPath = cubit.state.avatarPath;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          avatarPath != null
              ? CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                    child: CachedNetworkImage(
                      imageUrl: ImageDownloader.imageUrl(avatarPath),
                      placeholder: (context, url) => const LoadingIndicatorWidget(),
                      errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                    ),
                  ),
                )
              : Image.asset(AppImages.noImageAvailable),
          const SizedBox(width: 15.0),
          Text(
            username,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
