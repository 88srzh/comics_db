// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';

class HeadAccountCardWidget extends StatelessWidget {
  const HeadAccountCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<AccountDetailsCubit>();
    final String username = cubit.state.username;
    final String avatarPath = cubit.state.avatarPath;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100.0)),
              child: CachedNetworkImage(
                imageUrl: ImageDownloader.imageUrl(avatarPath),
                placeholder: (context, url) => const LoadingIndicatorWidget(),
                errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
              ),
            ),
          ),
          title: Text(
            username,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
