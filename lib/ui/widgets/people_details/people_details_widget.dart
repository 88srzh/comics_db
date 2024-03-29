// Flutter imports:
import 'package:comics_db_app/generated/l10n.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/people_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/people_details_cast_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/people_top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';

class PeopleDetailsWidget extends StatefulWidget {
  const PeopleDetailsWidget({super.key});

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
    return Scaffold(
      appBar: CustomAppBar(
          onTapRu: () => setState(() {
                S.load(const Locale('ru'));
              }),
          onTapEn: () => setState(() {
                S.load(const Locale('en'));
              })),
      body: ListView(
        children: [
          Column(
            children: [
              const PeopleTopPosterWidget(),
              DescriptionWidget(biographyTitle: S.of(context).biography),
              PeopleDetailsCastWidget(knownFor: S.of(context).knownFor),
              // KnowForWidget(),
              // const DescriptionWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
