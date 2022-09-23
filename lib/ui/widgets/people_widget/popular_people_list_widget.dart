import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/api_client/image_downloader.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Popular People',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: Stack(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                // childAspectRatio: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              // padding: const EdgeInsets.only(top: 70.0),
              itemCount: cubit.state.people.length,
              itemBuilder: (BuildContext context, int index) {
                cubit.showedPopularPeopleAtIndex(index);
                final people = cubit.state.people[index];
                final profilePath = people.profilePath;
                return InkWell(
                  onTap: () => cubit.onPeopleTap(context, index),
                  child: _PeoplePopularListColumnWidget(profilePath: profilePath, people: people, cubit: cubit, index: index),
                );
              },
            ),
            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: TextField(
                style: const TextStyle(
                  color: AppColors.genresText,
                ),
                onChanged: cubit.searchPopularPeople,
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: const TextStyle(
                    color: AppColors.genresText,
                  ),
                  filled: true,
                  fillColor: AppColors.kPrimaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                ),
              ),
            ),*/
          ],
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
              Image.network(
                ImageDownloader.imageUrl(profilePath),
                width: 95,
              ),
              const SizedBox(width: 15.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(height: .0),
                    Text(
                      people.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    // Text(
                    //   movie.releaseDate,
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(
                    //     color: AppColors.genresText,
                    //     fontSize: 13,
                    //   ),
                    // ),
                    // const SizedBox(height: 20.0),
                    // Text(
                    //   movie.overview ?? '',
                    //   maxLines: 3,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(
                    //     color: AppColors.genresText,
                    //     fontSize: 12,
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(width: 5.0),
            ],
          ),
        ),
        // InkWell(
        //   borderRadius: BorderRadius.circular(20.0),
        //   onTap: () => _onMovieTap(context, movie.id),
        // onTap: () => _onMovieTap(context, index),
        // ),
      ],
    );
  }
}
