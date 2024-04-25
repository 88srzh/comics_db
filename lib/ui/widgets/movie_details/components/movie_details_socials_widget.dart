import 'package:comics_db_app/ui/components/social_link_button_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MovieDetailsSocialsWidget extends StatelessWidget {
  const MovieDetailsSocialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieDetailsCubit>();
    final String? facebookId = cubit.state.facebookId;
    final String? instagramId = cubit.state.instagramId;
    final String? twitterId = cubit.state.twitterId;
    final String? homepage = cubit.state.homepage;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          facebookId != null ? SocialLinkButton(icon: MdiIcons.facebook, url: 'https://www.facebook.com/$facebookId') : const SizedBox.shrink(),
          const SizedBox(width: 8.0),
          twitterId != null ? SocialLinkButton(icon: MdiIcons.twitter, url: 'https://twitter.com/$twitterId') : const SizedBox.shrink(),
          const SizedBox(width: 8.0),
          instagramId != null ? SocialLinkButton(icon: MdiIcons.instagram, url: 'https://www.instagram.com/$instagramId') : const SizedBox.shrink(),
          const SizedBox(width: 8.0),
          homepage != null ? SocialLinkButton(icon: MdiIcons.link, url: homepage) : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
