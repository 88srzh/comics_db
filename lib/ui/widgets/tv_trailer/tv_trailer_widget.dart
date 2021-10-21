import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvTrailerWidget extends StatefulWidget {
  final String youtubeKey;
  const TvTrailerWidget({Key? key, required this.youtubeKey}) : super(key: key);

  @override
  _MovieTrailerWidgetState createState() => _MovieTrailerWidgetState();
}

class _MovieTrailerWidgetState extends State<TvTrailerWidget> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
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
        }
    );
  }
}
