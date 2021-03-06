import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerWidget extends StatefulWidget {
  final String? youtubeKey;

  const TrailerWidget({Key? key, required this.youtubeKey}) : super(key: key);

  @override
  State<TrailerWidget> createState() => _TrailerWidgetState();
}

class _TrailerWidgetState extends State<TrailerWidget> {
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
    var trailerData = context.select((MovieDetailsModel model) => model.data.trailerData);
    final trailerKey = trailerData.trailerKey;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trailer',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 21,
              color: AppColors.genresText,
            ),
          ),
          const SizedBox(height: 8.0),
          trailerKey != null
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
              : Image.asset(AppImages.noImageBig),
        ],
      ),
    );
  }
}
