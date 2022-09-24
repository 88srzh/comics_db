import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/cast_and_crew.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/peoples_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/people_top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeopleDetailsWidget extends StatefulWidget {
  const PeopleDetailsWidget({Key? key}) : super(key: key);

  @override
  State<PeopleDetailsWidget> createState() => _PeopleDetailsWidgetState();
}

class _PeopleDetailsWidgetState extends State<PeopleDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<PeopleDetailsCubit>().setupPeopleDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<PeopleDetailsCubit>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movie Details'),
      ),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: ListView(children: [
          Column(
            children: [
              const PeopleTopPosterWidget(),
              // const DescriptionWidget(),
            ],
          ),
        ]),
      ),
    );
  }
}
