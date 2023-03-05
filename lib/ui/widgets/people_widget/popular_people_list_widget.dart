// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/components/custom_cast_list_text_widget.dart';
import 'package:comics_db_app/ui/components/loading_indicator_widget.dart';
import 'package:comics_db_app/ui/widgets/people_widget/components/people_list_data.dart';
import 'package:comics_db_app/ui/widgets/people_widget/popular_people_list_cubit.dart';

class PopularPeopleListWidget extends StatefulWidget {
  const PopularPeopleListWidget({Key? key}) : super(key: key);

  @override
  State<PopularPeopleListWidget> createState() =>
      _PopularPeopleListWidgetState();
}

class _PopularPeopleListWidgetState extends State<PopularPeopleListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context
        .read<PeopleListCubit>()
        .setupPopularPeopleLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<PeopleListCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Popular People'),
      body: ColoredBox(
        color: DarkThemeColors.kPrimaryColor,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 3,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.65,
          ),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: cubit.state.people.length,
          itemBuilder: (BuildContext context, int index) {
            cubit.showedPopularPeopleAtIndex(index);
            final people = cubit.state.people[index];
            final profilePath = people.profilePath;
            return InkWell(
              onTap: () => cubit.onPeopleTap(context, index),
              child: _PeoplePopularListColumnWidget(
                  profilePath: profilePath,
                  people: people,
                  cubit: cubit,
                  index: index),
            );
          },
        ),
      ),
    );
  }
}

class _PeoplePopularListColumnWidget extends StatelessWidget {
  final int index;

  const _PeoplePopularListColumnWidget({
    Key? key,
    required this.profilePath,
    required this.people,
    required this.cubit,
    required this.index,
  }) : super(key: key);

  final String? profilePath;
  final PeopleListData people;
  final PeopleListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: DarkThemeColors.kPrimaryColor,
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              )
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              profilePath != null
                  ? CachedNetworkImage(
                      imageUrl: ImageDownloader.imageUrl(profilePath!),
                      placeholder: (context, url) =>
                          const LoadingIndicatorWidget(),
                      errorWidget: (context, url, dynamic error) =>
                          Image.asset(AppImages.noImageAvailable),
                    )
                  : Image.asset(AppImages.noImageAvailable),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCastListTextWidget(
                        text: people.name,
                        maxLines: 1,
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
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
