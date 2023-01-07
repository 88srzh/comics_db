// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvTrailerWidget extends StatefulWidget {
  final String tvYoutubeKey;
  const TvTrailerWidget({Key? key, required this.tvYoutubeKey})
      : super(key: key);

  @override
  State<TvTrailerWidget> createState() => _TvTrailerWidgetState();
}

class _TvTrailerWidgetState extends State<TvTrailerWidget> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.tvYoutubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                player,
              ],
            ),
          );
        });
  }
}
