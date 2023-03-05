// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/people/popular_people_list_bloc.dart';
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
    return BlocConsumer<PeopleListBloc, PeopleListState>(
      listener: (context, state) {
        if (!state.peopleContainer.isComplete) {
          final locale = Localizations.localeOf(context);
          context
              .read<PeopleDetailsCubit>()
              .setupPeopleDetailsLocale(context, locale.languageCode);
        }
      },
      builder: (context, state) {
        if (state.peopleContainer.isComplete) {
          return Scaffold(
            appBar: const CustomDetailsAppBar(title: ''),
            body: ColoredBox(
              // color: notifierTheme.isDark ? AppColors.kPrimaryColor : Colors.transparent,
              color: DarkThemeColors.kPrimaryColor,
              child: ListView(
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
            ),
          );
        } else {
          return const Center(child: Text('error'));
        }
      },
    );
  }
}
