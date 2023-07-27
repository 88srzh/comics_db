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
  late String videoTitle;

  // url list
  final List<String> _videoUrlList = [
    "OW1mU4vBBEU",
    "tnXIcwd221g",
    "DMTufSkyx6E",
  ];

  List<YoutubePlayerController> listYoutubePlayerController = [];

  // late final YoutubePlayerController _controller;
  Map<String, dynamic> cStates = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    fillYoutubePlayerLists;

    // _controller = YoutubePlayerController(
    //   initialVideoId: widget.youtubeKey ?? '',
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: false,
    //     mute: true,
    //   ),
    // );
  }

  void fillYoutubePlayerLists() {
    for (var element in _videoUrlList) {
      String id = element;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: id,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
        ),
      );
      controller.addListener(() {
        print('for $id got isPlaying state ${controller.value.isPlaying}');
        if (cStates[id] != controller.value.isPlaying) {
          if (mounted) {
            setState(() {
              cStates[id] = controller.value.isPlaying;
            });
          }
        }
      });
      listYoutubePlayerController.add(controller);
    }
  }

  // @override
  // void dispose() {
  //   for (var element in listYoutubePlayerController) {
  //     element.dispose();
  //   }
  // }

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
    if (videosData!.isEmpty) return const SizedBox.shrink();
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
                itemCount: _videoUrlList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  YoutubePlayerController controller = listYoutubePlayerController[index];
                  String id = _videoUrlList[index];
                  // String? id = YoutubePlayer.convertUrlToId(_videoUrlList[index]);
                  String currentState = 'undefined';
                  // TODO must be fix
                  // if (cStates[id] != null) {
                  //   currentState = cStates[id] ? 'playing' : 'paused';
                  // }
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: controller,
                            showVideoProgressIndicator: true,
                            onReady: () {
                              print('on ready for $index');
                            },
                            onEnded: (YoutubeMetaData _md) {
                              controller.seekTo(const Duration(seconds: 0));
                            },
                          ),
                          builder: (context, player) {
                            return Column(
                              children: [
                                player,
                              ],
                            );
                          },
                        ),
                        Text(
                          currentState,
                          style: const TextStyle(color: Colors.white),
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
