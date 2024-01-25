// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/components/custom_social_icon.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_trailer_widget.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_poster_top_left_text_rating_widget.dart';
import 'package:comics_db_app/ui/components/custom_poster_top_left_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_details_title.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class MovieTopPosterWidget extends StatefulWidget {
  const MovieTopPosterWidget({super.key});

  @override
  State<MovieTopPosterWidget> createState() => _MovieTopPosterWidgetState();
}

class _MovieTopPosterWidgetState extends State<MovieTopPosterWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieDetailsCubit>();
    final title = cubit.state.title;
    final tagline = cubit.state.tagline;
    final voteAverage = cubit.state.voteAverage;
    final voteAverageString = voteAverage!.toStringAsFixed(1);
    final voteCount = cubit.state.voteCount;
    final popularity = cubit.state.popularity;
    int? popularityInt = popularity?.toInt();
    final releaseDate = cubit.state.releaseDate;
    final summary = cubit.state.summary;
    final genres = cubit.state.genres;
    final posterPath = cubit.state.posterPath;
    final backdropPath = cubit.state.backdropPath;
    late String trailerKey = cubit.state.videos.first.key;
    if (cubit.state.videos.isEmpty) return const SizedBox.shrink();
    // late String? facebook = cubit.state.externalIds.first.facebookId;
    // late String? facebook = 'transformersmovie';
    // late String? facebook = cubit.state.facebook;
    // final Uri facebookUrl = Uri.parse('https://www.facebook.com/$facebook');
    // Future<void>? _launched;
    // final Uri toLaunch = Uri(scheme: 'https', host: 'www.facebook.com', path: facebook);

    // TODO malfunction
    // late String? instagram = cubit.state.externalIds.first.instagramId;

    return Stack(
      children: [
        Positioned(
          child: Opacity(
            opacity: 0.25,
            child: AspectRatio(
              aspectRatio: 390 / 230,
              child: CachedNetworkImage(
                imageUrl: ImageDownloader.imageUrl(backdropPath!),
                placeholder: (context, url) => const LoadingIndicatorWidget(),
                errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 20,
          child: MovieDetailsTitle(title: title),
        ),
        Positioned(
          top: 40,
          left: 20,
          child: SizedBox(
            height: 300,
            width: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        tagline ?? 'No tagline',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    CustomPosterTopLeftAlignText(
                      text: releaseDate,
                      maxLines: null,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomPosterTopLeftAlignText(text: summary, maxLines: null),
                  ],
                ),
                Column(
                  children: [
                    CustomPosterTopLeftAlignText(text: genres, maxLines: 2),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      MdiIcons.starOutline,
                      // TODO вывести в переменную
                      color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    CustomPosterTopLeftAlignTextRating(text: '$voteAverageString from IMDB'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      MdiIcons.accountOutline,
                      color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    CustomPosterTopLeftAlignTextRating(text: voteCount.toStringAsFixed(0)),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      MdiIcons.heartOutline,
                      color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    CustomPosterTopLeftAlignTextRating(text: popularityInt.toString()),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      MdiIcons.youtube,
                      color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      // add popup to trailer
                      onTap: () {
                        showDialog<Widget>(
                          context: context,
                          builder: (context) => Stack(
                            children: [
                              Positioned(
                                top: 250,
                                child: MovieDetailsTrailerWidget(youtubeKey: trailerKey),
                              ),
                            ],
                          ),
                        );
                      },
                      // onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.movieTrailer),
                      child: const CustomPosterTopLeftAlignText(text: 'Play Trailer', maxLines: 1),
                    ),
                  ],
                ),
                // so far don't work
                Row(
                  children: [
                    InkWell(
                      // onTap: () => setState(() {
                      //   _launched = _launchInBrowser(toLaunch);
                      // }),
                      child: CustomSocialIcon(icon: MdiIcons.facebook),
                    ),
                    const SizedBox(width: 4.0),
                    CustomSocialIcon(icon: MdiIcons.twitter),
                    const SizedBox(width: 4.0),
                    CustomSocialIcon(icon: MdiIcons.instagram),
                    const SizedBox(width: 4.0),
                    CustomSocialIcon(icon: MdiIcons.home),
                    // const SizedBox(width: 8.0),
                    // CustomPosterTopLeftAlignText(text: instagram!, maxLines: 1),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 55,
          right: 15,
          child: SizedBox(
            //     TODO: не закругляются края
            height: 180.0,
            width: 140.0,
            child: CachedNetworkImage(
              imageUrl: ImageDownloader.imageUrl(posterPath!),
              placeholder: (context, url) => const LoadingIndicatorWidget(),
              errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
            ),
          ),
        ),
      ],
    );
  }
}

// Future<void> _launchInBrowser(Uri url) async {
//   if (!await launchUrl(
//     url,
//     mode: LaunchMode.externalApplication,
//   )) {
//     throw Exception('Could not launch $url');
//   }
// }
