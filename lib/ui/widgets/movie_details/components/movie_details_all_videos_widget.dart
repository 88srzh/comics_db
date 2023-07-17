// Flutter imports:
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsAllVideosWidget extends StatefulWidget {
  const MovieDetailsAllVideosWidget({Key? key}) : super(key: key);

  @override
  State<MovieDetailsAllVideosWidget> createState() => _MovieDetailsAllVideosWidgetState();
}

class _MovieDetailsAllVideosWidgetState extends State<MovieDetailsAllVideosWidget> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeKey ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<MovieDetailsCubit>().setupMovieDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieDetailsCubit>();
    var videosData = cubit.data.videosData;
    if (videosData.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Videos',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 250.0,
            child: Scrollbar(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cubit.state.allVideos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                          ),
                          builder: (context, player) {
                            return Column(
                              children: [
                                player,
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onMovieTap(BuildContext context, int index) {
    final cubit = context.read<MovieDetailsCubit>();
    final movieId = cubit.state.allVideos[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: movieId);
  }
}
