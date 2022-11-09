import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/components/custom_appbar.dart';
import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:comics_db_app/ui/widgets/people_widget/components/people_list_data.dart';
import 'package:comics_db_app/ui/widgets/people_widget/popular_people_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularPeopleListWidget extends StatefulWidget {
  const PopularPeopleListWidget({Key? key}) : super(key: key);

  @override
  State<PopularPeopleListWidget> createState() => _PopularPeopleListWidgetState();
}

class _PopularPeopleListWidgetState extends State<PopularPeopleListWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<PeopleListCubit>().setupPopularPeopleLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<PeopleListCubit>();
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     'Popular People',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   foregroundColor: Colors.white,
      //   backgroundColor: AppColors.kPrimaryColor,
      // ),
      appBar: CustomAppBar(title: 'Popular People'),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
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
              // TODO fix tap
              onTap: () => cubit.onPeopleTap(context, index),
              child:
                  _PeoplePopularListColumnWidget(profilePath: profilePath, people: people, cubit: cubit, index: index),
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

  final String profilePath;
  final PeopleListData people;
  final PeopleListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
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
              CachedNetworkImage(
                imageUrl: ImageDownloader.imageUrl(profilePath),
                placeholder: (context, url) => const LoadingIndicatorWidget(),
                errorWidget: (context, url, dynamic error) => Image.asset(AppImages.noImageBig),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(height: .0),
                    // TODO need to fix space between photo and text
                    Text(
                      people.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
