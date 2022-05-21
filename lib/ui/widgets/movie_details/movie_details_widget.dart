import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/peoples_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    Future.microtask(
      () => context.read<MovieDetailsModel>().setupLocale(context, locale),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((MovieDetailsModel model) => model.data.isLoading);
    if (isLoading) {
      return const Center(
        child: LoadingIndicatorWidget(),
      );
    }
    var trailerData = context.select((MovieDetailsModel model) => model.data.trailerData);
    final trailerKey = trailerData.trailerKey;

    return Scaffold(
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: ListView(
          children: [
            Column(
              children: [
                const MovieTopPosterWidget(),
                const DescriptionWidget(),
                TrailerWidget(youtubeKey: trailerKey),
                const PeoplesWidget(),
                // const FullCastAndCrewWidget(),
                // const MovieSimilarWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CastWidget extends StatelessWidget {
  const _CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Актеры'),
          ),
          const SizedBox(
            height: 250.0,
            child: Scrollbar(
              child: _MovieActorListWidget(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {},
                // onTap: () async => showFullCastAndCrew(context),
                child: const Text('Полный актерский состав')),
          ),
        ],
      ),
    );
  }
}

class _MovieActorListWidget extends StatelessWidget {
  const _MovieActorListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var actorsData = context.select((MovieDetailsModel model) => model.data.actorsData);
    if (actorsData.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: actorsData.length,
      itemExtent: 120,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _MovieActorListItemWidget(actorIndex: index);
      },
    );
  }
}

class _MovieActorListItemWidget extends StatelessWidget {
  final int actorIndex;

  const _MovieActorListItemWidget({Key? key, required this.actorIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailsModel>();
    final actor = model.data.actorsData[actorIndex];
    final profilePath = actor.profilePath;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              profilePath != null ? Image.network(ImageDownloader.imageUrl(profilePath)) : const Image(image: AssetImage(AppImages.noImage)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(actor.name, maxLines: 1),
                      const SizedBox(height: 7),
                      Text(actor.character, maxLines: 2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
