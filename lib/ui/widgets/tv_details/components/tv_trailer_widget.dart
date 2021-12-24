import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvTrailerWidget extends StatefulWidget {
  final String  youtubeKey;
  const TvTrailerWidget({
    Key? key,
     required this.youtubeKey,
  }) : super(key: key);

  @override
  _TvTrailerWidgetState createState() => _TvTrailerWidgetState();
}

class _TvTrailerWidgetState extends State<TvTrailerWidget> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
        initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final tvDetails = Provider.of<TvDetailsModel>(context, listen: true).tvDetails;
    final videos = tvDetails?.videos.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos?.isNotEmpty  == true ? videos?.first.key : null;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Трейлер',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 21,
              color: AppColors.genresText,
            ),
          ),
          const SizedBox(height: 8.0),
          trailerKey != null ?
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
              }
          ) : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
