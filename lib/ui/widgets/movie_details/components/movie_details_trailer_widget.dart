// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsTrailerWidget extends StatefulWidget {
  final String? youtubeKey;

  const MovieDetailsTrailerWidget({super.key, required this.youtubeKey});

  @override
  State<MovieDetailsTrailerWidget> createState() => _MovieDetailsTrailerWidgetState();
}

class _MovieDetailsTrailerWidgetState extends State<MovieDetailsTrailerWidget> {
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
