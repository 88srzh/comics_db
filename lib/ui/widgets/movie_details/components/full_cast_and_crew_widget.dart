import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FullCastAndCrewWidget extends StatefulWidget {
  const FullCastAndCrewWidget({Key? key}) : super(key: key);

  @override
  State<FullCastAndCrewWidget> createState() => _FullCastAndCrewWidgetState();
}

class _FullCastAndCrewWidgetState extends State<FullCastAndCrewWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<MovieDetailsCubit>().setupMovieDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieDetailsCubit>();
    var actorsData = cubit.data.actorsData;
    if (actorsData.isEmpty) return const SizedBox.shrink();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Full Cast And Crew'),
      body: ColoredBox(
        color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 3,
            childAspectRatio: 1 / 1.8,
          ),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: cubit.data.actorsData.length,
          itemBuilder: (BuildContext context, int index) {
            return _FullCastAndCrewListWidget(
              actorIndex: index,
            );
          },
        ),
      ),
    );
  }
}

class _FullCastAndCrewListWidget extends StatelessWidget {
  final int actorIndex;

  const _FullCastAndCrewListWidget({Key? key, required this.actorIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieDetailsCubit>();
    final actor = cubit.data.actorsData[actorIndex];
    // final actorId = actor.id;
    final profilePath = actor.profilePath;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
            border: Border.all(
              color:
                  context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                color: context.read<ThemeBloc>().isDarkTheme
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              profilePath != null
                  ? CachedNetworkImage(
                      imageUrl: ImageDownloader.imageUrl(profilePath),
                      placeholder: (context, url) => const LoadingIndicatorWidget(),
                      errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                    )
                  : Image.asset(AppImages.noImageAvailable),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCastListTextWidget(text: actor.name, maxLines: 1),
                    const SizedBox(height: 4.0),
                    CustomCastListTextWidget(text: actor.character, maxLines: 2),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
