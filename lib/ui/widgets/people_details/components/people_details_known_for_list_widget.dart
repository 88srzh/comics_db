// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';

class PeopleDetailsKnownForListWidget extends StatefulWidget {
  const PeopleDetailsKnownForListWidget({super.key});

  @override
  State<PeopleDetailsKnownForListWidget> createState() => _PeopleDetailsKnownForListWidgetState();
}

class _PeopleDetailsKnownForListWidgetState extends State<PeopleDetailsKnownForListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<PeopleDetailsCubit>().setupPeopleDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PeopleDetailsCubit>();
    var characterData = cubit.data.charactersData;
    if (characterData.isEmpty) return const SizedBox.shrink();
    return Scaffold(
      appBar: CustomAppBar(
        onTapRu: () {},
        onTapEn: () {},
      ),
      body: ColoredBox(
        color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 3,
            childAspectRatio: 1 / 1.9,
          ),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: characterData.length,
          itemBuilder: (BuildContext context, int index) {
            return _KnownForAllListWidget(
              characterIndex: index,
            );
          },
        ),
      ),
    );
  }
}

class _KnownForAllListWidget extends StatelessWidget {
  final int characterIndex;

  const _KnownForAllListWidget({
    required this.characterIndex,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PeopleDetailsCubit>();
    final character = cubit.data.charactersData[characterIndex];
    // final characterId = character.id;
    final posterPath = character.posterPath;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
            border: Border.all(
              color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              posterPath != null
                  ? CachedNetworkImage(
                      imageUrl: ImageDownloader.imageUrl(posterPath),
                      placeholder: (context, url) => const LoadingIndicatorWidget(),
                      errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageAvailable),
                    )
                  : Image.asset(AppImages.noImageAvailable),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCastListTextWidget(text: character.title, maxLines: 1),
                    const SizedBox(height: 4.0),
                    CustomCastListTextWidget(text: character.character, maxLines: 2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
