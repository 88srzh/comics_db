// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Project imports:
import 'package:comics_db_app/resources/resources.dart';

class TvTrailerYoutubeWidget extends StatefulWidget {
  final String? youtubeKey;

  const TvTrailerYoutubeWidget({
    Key? key,
    required this.youtubeKey,
  }) : super(key: key);

  @override
  State<TvTrailerYoutubeWidget> createState() => _TvTrailerYoutubeWidgetState();
}

class _TvTrailerYoutubeWidgetState extends State<TvTrailerYoutubeWidget> {
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
    // var tvTrailerData =
    //     context.select((TvDetailsModel model) => model.tvData.tvTrailedData);
    // final tvTrailerKey = tvTrailerData.trailerKey;
    // var cubit = context.watch<TvDetailsCubit>();
    const tvTrailerKey = '';
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trailer',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8.0),
          tvTrailerKey.isNotEmpty
              ? YoutubePlayerBuilder(
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
                )
              : Image.asset(
                  AppImages.noVideoAvailable,
                  width: double.infinity,
                ),
        ],
      ),
    );
  }
}
