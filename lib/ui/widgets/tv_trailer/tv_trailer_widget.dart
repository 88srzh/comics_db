// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// TODO analog in movie details widget
class TvDetailsTrailerWidget extends StatefulWidget {
  final String? tvYoutubeKey;

  const TvDetailsTrailerWidget({Key? key, required this.tvYoutubeKey}) : super(key: key);

  @override
  State<TvDetailsTrailerWidget> createState() => _TvDetailsTrailerWidgetState();
}

class _TvDetailsTrailerWidgetState extends State<TvDetailsTrailerWidget> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.tvYoutubeKey ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
