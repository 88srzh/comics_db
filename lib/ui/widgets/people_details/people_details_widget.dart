// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/cast_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/people_top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';
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
    context
        .read<PeopleDetailsCubit>()
        .setupPeopleDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomDetailsAppBar(title: ''),
      body: ListView(
        children: [
          Column(
            children: const [
              PeopleTopPosterWidget(),
              DescriptionWidget(),
              CastWidget(),
              // KnowForWidget(),
              // const DescriptionWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
